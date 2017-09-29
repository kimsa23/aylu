unit Impressao.LivroProducao;

interface

uses
  Forms, Windows, Messages, SysUtils, Variants, Classes, Graphics, Controls,
  Dialogs,
  DB, dbclient,
  FireDAC.Comp.Client,
  uConstantes,
  orm.empresa, classe.aplicacao,
  frxClass, frxDBSet;

type
  TfrmLivroProducaoImprimir = class(TForm)
    dtslivro: TDataSource;
    dtsempresa: TDataSource;
    dtsmovproducao: TDataSource;
    dbdmovproducao: TfrxDBDataset;
    frxmovproducao: TfrxReport;
    frx1: TfrxReport;
    dbdempresa: TfrxDBDataset;
    frxTermoAbertura: TfrxReport;
    dbdlivro: TfrxDBDataset;
    frxlivroimprimir: TfrxReport;
    frxLivroImprimirA3: TfrxReport;
    procedure rptLivroImprimirStartPage(Sender: TObject);
    procedure rptLivroImprimirA3StartPage(Sender: TObject);
    procedure rptTermoAberturaBeforePrint(Sender: TObject);
  private { Private declarations }
    nupagina     : integer;
  public { Public declarations }
  end;

var
  frmLivroProducaoImprimir: TfrmLivroProducaoImprimir;

function imprimirlivroproducao                  (cdlivro: integer; nupaginainicial:integer): boolean;
function imprimirlivroproducaotermo             (tipo:string; nupaginas, nuordem:integer; dtinicio: TDate): boolean;
function imprimirlivroproducaoresumomovimentacao(cdlivro: integer; mp:string=''): boolean;

implementation

{$R *.dfm}

function makesqlempresa:string;
begin
  result := 'SELECT E.CDEMPRESA'+
                  ',E.CDUF'+
                  ',E.RZSOCIAL'+
                  ',E.NMRESPONSAVEL'+
                  ',E.DSENDERECO'+
                  ',E.DSNUMERO'+
                  ',E.NMBAIRRO'+
                  ',nmmunicipio municipio'+
                  ',E.NUCNPJ'+
                  ',e.nucpf'+
                  ',E.NUCEP'+
                  ',E.NUINSCEST'+
                  ',UF.NMUF '+
            'FROM EMPRESA e '+
            'left join municipio m on m.cdmunicipio=e.cdmunicipio '+
            'INNER JOIN UF ON UF.CDUF=E.CDUF';
end;

function imprimirlivroproducao(cdlivro: integer; nupaginainicial:integer): boolean;
var
  qt : tclientdataset;
  procedure criar_dataset;
  begin
    qt.FieldDefs.add(_cd+_it+_livro    , ftinteger, 0, true);
    qt.FieldDefs.Add(_cdproduto    , ftinteger, 0, true);
    qt.FieldDefs.Add(_dsespecie    , ftstring, 5);
    qt.FieldDefs.Add(_ds+_sub+_serie   , ftstring, 3);
    qt.FieldDefs.Add(_nudocumento  , ftinteger);
    qt.FieldDefs.Add(_nulivro      , ftinteger);
    qt.FieldDefs.Add(_nufolha      , ftinteger);
    qt.FieldDefs.Add(_dtsaida      , ftdate);
    qt.FieldDefs.Add(_nudia        , ftinteger);
    qt.FieldDefs.Add(_numes        , ftinteger);
    qt.FieldDefs.Add(_dscontabil   , ftstring, 6);
    qt.FieldDefs.Add(_nufiscal     , ftinteger);
    qt.FieldDefs.Add(_tpentsai     , ftstring, 1);
    qt.FieldDefs.Add(_qtitementrada, ftcurrency);
    qt.FieldDefs.Add(_vlbaseipi+_entrada, ftcurrency);
    qt.FieldDefs.Add(_vlipi+_entrada    , ftcurrency);
    qt.FieldDefs.Add(_qtestoque       , ftcurrency);
    qt.FieldDefs.Add(_observacao      , ftstring, 100);
    qt.FieldDefs.Add(_qtitem+_saida     , ftcurrency);
    qt.FieldDefs.Add(_vlbase+_ipi+_saida, ftcurrency);
    qt.FieldDefs.Add(_vlipi+_saida      , ftcurrency);
    qt.FieldDefs.Add(_qtentproprio    , ftcurrency);
    qt.FieldDefs.Add(_qtentoutro      , ftcurrency);
    qt.FieldDefs.Add(_qtsaiproprio    , ftcurrency);
    qt.FieldDefs.Add(_qtsaioutro      , ftcurrency);
    qt.FieldDefs.Add(_nmproduto       , ftstring, 100);
    qt.FieldDefs.Add(_nmunidade       , ftstring, 100);
    qt.FieldDefs.Add(_nuclfiscal      , ftstring, 20);
    qt.FieldDefs.Add(_nunivel         , ftstring, 20);
    qt.CreateDataSet;
    qt.open;
  end;
  procedure create_temp_table;
  var
    q : Tfdquery;
    procedure inserir_registro(sql:string);
    begin
      q.close;
      q.sql.text   := sql;
      q.Open;
      while not q.Eof do
      begin
        qt.Append;
        qt.Fieldbyname(_cd+_it+_livro).AsInteger   := q.fieldbyname(_cd+_it+_livro).AsInteger;
        qt.Fieldbyname(_cdproduto).AsInteger   := q.fieldbyname(_cdproduto).AsInteger;
        qt.Fieldbyname(_dsespecie).AsString    := q.fieldbyname(_dsespecie).AsString;
        qt.Fieldbyname(_ds+_sub+_serie).AsString   := q.fieldbyname(_ds+_sub+_serie).AsString;
        qt.Fieldbyname(_dtsaida).AsDateTime    := q.fieldbyname(_dtsaida).AsDateTime;
        qt.Fieldbyname(_ds+_contabil).AsString   := q.fieldbyname(_ds+_contabil).AsString;
        qt.Fieldbyname(_tpentsai).AsString     := q.fieldbyname(_tpentsai).AsString;
        qt.Fieldbyname(_observacao).AsString   := q.fieldbyname(_observacao).AsString;
        qt.Fieldbyname(_nmproduto).AsString    := q.fieldbyname(_nmproduto).AsString;
        qt.Fieldbyname(_nmunidade).AsString    := q.fieldbyname(_nmunidade).AsString;
        if q.fieldbyname(_nudocumento).AsInteger       <> 0 then qt.Fieldbyname(_nudocumento).AsInteger       := q.fieldbyname(_nudocumento).AsInteger;
        if q.fieldbyname(_nu+_livro).AsInteger           <> 0 then qt.Fieldbyname(_nu+_livro).AsInteger           := q.fieldbyname(_nu+_livro).AsInteger;
        if q.fieldbyname(_nu+_folha).AsInteger           <> 0 then qt.Fieldbyname(_nu+_folha).AsInteger           := q.fieldbyname(_nu+_folha).AsInteger;
        if q.fieldbyname(_nudia).AsInteger             <> 0 then qt.Fieldbyname(_nudia).AsInteger             := q.fieldbyname(_nudia).AsInteger;
        if q.fieldbyname(_nu+_mes).AsInteger             <> 0 then qt.Fieldbyname(_nu+_mes).AsInteger             := q.fieldbyname(_nu+_mes).AsInteger;
        if q.fieldbyname(_nu+_fiscal).AsInteger          <> 0 then qt.Fieldbyname(_nu+_fiscal).AsInteger          := q.fieldbyname(_nu+_fiscal).AsInteger;
        if q.fieldbyname(_qtitem+_entrada).AsCurrency    <> 0 then qt.Fieldbyname(_qtitem+_entrada).AsCurrency    := q.fieldbyname(_qtitem+_entrada).AsCurrency;
        if q.fieldbyname(_vlbase+_ipi+_entrada).AsCurrency <> 0 then qt.Fieldbyname(_vlbase+_ipi+_entrada).AsCurrency := q.fieldbyname(_vlbase+_ipi+_entrada).AsCurrency;
        if q.fieldbyname(_vlipi+_entrada).AsCurrency     <> 0 then qt.Fieldbyname(_vlipi+_entrada).AsCurrency     := q.fieldbyname(_vlipi+_entrada).AsCurrency;
        if q.fieldbyname(_qtestoque).AsCurrency        <> 0 then qt.Fieldbyname(_qtestoque).AsCurrency        := q.fieldbyname(_qtestoque).AsCurrency;
        if q.fieldbyname(_qtitem+_saida).AsCurrency      <> 0 then qt.Fieldbyname(_qtitem+_saida).AsCurrency      := q.fieldbyname(_qtitem+_saida).AsCurrency;
        if q.fieldbyname(_vlbase+_ipi+_saida).AsCurrency   <> 0 then qt.Fieldbyname(_vlbase+_ipi+_saida).AsCurrency   := q.fieldbyname(_vlbase+_ipi+_saida).AsCurrency;
        if q.fieldbyname(_vlipi+_saida).AsCurrency       <> 0 then qt.Fieldbyname(_vlipi+_saida).AsCurrency       := q.fieldbyname(_vlipi+_saida).AsCurrency;
        if q.fieldbyname(_qt+_ent+_proprio).AsCurrency     <> 0 then qt.Fieldbyname(_qt+_ent+_proprio).AsCurrency     := q.fieldbyname(_qt+_ent+_proprio).AsCurrency;
        if q.fieldbyname(_qt+_ent+_outro).AsCurrency       <> 0 then qt.Fieldbyname(_qt+_ent+_outro).AsCurrency       := q.fieldbyname(_qt+_ent+_outro).AsCurrency;
        if q.fieldbyname(_qt+_sai+_proprio).AsCurrency     <> 0 then qt.Fieldbyname(_qt+_sai+_proprio).AsCurrency     := q.fieldbyname(_qt+_sai+_proprio).AsCurrency;
        if q.fieldbyname(_qt+_sai+_outro).AsCurrency       <> 0 then qt.Fieldbyname(_qt+_sai+_outro).AsCurrency       := q.fieldbyname(_qt+_sai+_outro).AsCurrency;
             if not q.Fieldbyname(_NUCLFISCAL+_P).isnull then qt.fieldbyname(_NUCLFISCAL).AsString := q.fieldbyname(_NUCLFISCAL+_P).AsString
        else if not q.fieldbyname(_NUCLFISCAL+_G).isnull then qt.fieldbyname(_NUCLFISCAL).AsString := q.fieldbyname(_NUCLFISCAL+_G).AsString;
        qt.Fieldbyname(_nunivel).AsString            := q.fieldbyname(_nunivel).AsString;
        qt.post;
        q.Next;
      end;
    end;
  begin
    criar_dataset;
    q := Tfdquery.create(nil);
    try
      q.Connection := aplicacao.confire;
      inserir_registro('SELECT CDLIVRO'+
                              ',cdITLIVRO'+
                              ',I.cdITENTRADA'+
                              ',cdITMOVTO'+
                              ',I.CDPRODUTO'+
                              ',cdITSAIDA'+
                              ',DSESPECIE'+
                              ',DSSUBSERIE'+
                              ',NUDOCUMENTO'+
                              ',NULIVRO'+
                              ',NUFOLHA'+
                              ',DTSAIDA'+
                              ',NUDIA'+
                              ',NUMES'+
                              ',DSCONTABIL'+
                              ',NUFISCAL'+
                              ',TPENTSAI'+
                              ',QTITEMENTRADA'+
                              ',VLBASEIPIENTRADA'+
                              ',VLIPIENTRADA'+
                              ',I.QTESTOQUE'+
                              ',OBSERVACAO'+
                              ',QTITEMSAIDA' +
                              ',VLBASEIPISAIDA'+
                              ',VLIPISAIDA'+
                              ',QTENTPROPRIO'+
                              ',QTENTOUTRO'+
                              ',QTSAIPROPRIO'+
                              ',QTSAIOUTRO'+
                              ',NMPRODUTO'+
                              ',NMUNIDADE'+
                              ',P.NUCLFISCAL NUCLFISCALP'+
                              ',G.NUCLFISCAL NUCLFISCALG'+
                              ',g.nunivel'+
                              ',I.TSINCLUSAO'+
                              ',I.CDUSUARIOI'+
                              ',I.CDCOMPUTADORI'+
                              ',I.TSALTERACAO'+
                              ',I.CDUSUARIOA'+
                              ',I.CDCOMPUTADORA '+
                         'FROM ITLIVRO i '+
                         'INNER JOIN PRODUTO p ON I.CDPRODUTO=P.CDPRODUTO and i.cdempresa=p.cdempresa '+
                         'INNER JOIN GRUPO g ON G.CDGRUPO=P.CDGRUPO and g.cdempresa=p.cdempresa '+
                         'INNER JOIN UNIDADE u ON U.CDUNIDADE=P.CDUNIDADE and u.cdempresa=p.cdempresa '+
                         'WHERE i.cdempresa='+empresa.cdempresa.tostring+' and CDLIVRO='+cdlivro.tostring+' '+
                         'ORDER BY G.NUNIVEL,NMPRODUTO,cdITLIVRO');
      qt.AddIndex(_pk, 'nunivel;nmproduto;cditlivro', [ixunique]);
      qt.IndexName := _pk;
    finally
      freeandnil(q);
    end;
  end;
var
  cempresa : Tfdquery;
begin
  cempresa := Tfdquery.Create  (nil);
  frmLivroProducaoImprimir := TfrmLivroProducaoImprimir.Create(application);
  qt := tclientdataset.create(nil);
  try
    cempresa.Connection := aplicacao.confire;
    cempresa.sql.text   := makesqlempresa;
    cempresa.Open;
    create_temp_table;
    with frmLivroProducaoImprimir do
    begin
      dtsempresa.DataSet := cempresa;
      dtslivro.DataSet   := qt;
      nupagina           := nupaginainicial;
      nupagina           := nupaginainicial;
      frxLivroImprimirA3.ShowReport;
    end;
    result := true
  finally
    freeandnil(qt);
    freeandnil(cempresa);
    freeandnil(frmLivroProducaoImprimir);
  end;
end;

function imprimirlivroproducaotermo(tipo:string; nupaginas, nuordem:integer; dtinicio: TDate): boolean;
var
  cempresa : Tfdquery;
begin
  cempresa                 := Tfdquery.Create  (nil);
  frmLivroProducaoImprimir := TfrmLivroProducaoImprimir.Create(application);
  try
    cempresa.Connection := aplicacao.confire;
    cempresa.sql.text   := makesqlempresa;
    cempresa.Open;
    with frmlivroproducaoimprimir do
    begin
      dtsempresa.DataSet := cempresa;
      if lowercase(tipo) = _abertura then
      begin
        //lbltermo.caption   := 'TERMO ABERTURA';
        //lblnufolha.caption := stringofchar(_0, 4)+_1;
      end
      else if lowercase(tipo) = 'encerramento' then
      begin
        //lblnufolha.caption := FormatFloat(stringofchar(_0, 4),nupaginas);
        //lbltermo.caption   := 'TERMO ENCERRAMENTO';
      end;
      //lblnmmunicipio.Caption  := cempresa.Fieldbyname(_municipio).AsString+', '+ formatdatetime(_DD, dtinicio)+' DE '+UpperCase(RetiraAcentos(formatdatetime(_MMMM, dtinicio)))+' DE '+formatdatetime(_YYYY, dtinicio);
      //LBLENDERECO.Caption     := cempresa.Fieldbyname(_dsendereco).Asstring+', '+cempresa.fieldbyname(_dsnumero).AsString;
      //pplblnuordem.Caption    := FormatFloat(stringofchar(_0, 3),nuordem);
      //pplblnupaginas.Caption  := FormatFloat(stringofchar(_0, 4),nupaginas); //IntToStr(nupaginas);
      //pplblnupaginas1.Caption := FormatFloat(stringofchar(_0, 4),nupaginas);
      frxTermoAbertura.ShowReport;
    end;
    result := true
  finally
    freeandnil(frmLivroProducaoImprimir);
    freeandnil(cempresa);
  end;
end;

function imprimirlivroproducaoresumomovimentacao(cdlivro: integer; mp:string=''): boolean;
  function makesql:string;
  begin
    result := 'select g.cdgrupo'+
                    ',g.nmgrupo'+
                    ',lp.qtestoque-lp.QTITEMENTRADA-lp.QTENTPROPRIO-lp.QTENTOUTRO+lp.QTITEMSAIDA+lp.QTSAIPROPRIO+lp.QTSAIOUTRO qtestoqueanterior'+
                    ',lp.qtestoque'+
                    ',lp.QTITEMENTRADA'+
                    ',lp.QTENTPROPRIO'+
                    ',lp.QTENTOUTRO'+
                    ',lp.QTITEMSAIDA'+
                    ',lp.QTSAIPROPRIO'+
                    ',(select sum(QTSAIPROPRIO) from itlivro where cdempresa=l.cdempresa and dsespecie=''BAIXA'' AND cdproduto=p.cdproduto and cdlivro=l.cdlivro) qtbaixa '+
                    ',(select sum(dvc.QTITEMENTRADA) '+
                      'from itlivro DVC '+
                      'where DVC.cdempresa=l.cdempresa and dvc.dsespecie=''NF'' AND DVC.cdproduto=p.cdproduto and DVC.cdlivro=l.cdlivro) qtdvcompra'+
                    ',(select sum(DVV.QTITEMENTRADA) '+
                      'from itlivro DVV '+
                      'where dvv.cdempresa=l.cdempresa and DVV.dsespecie=''NF'' AND DVV.cdproduto=p.cdproduto and DVV.cdlivro=l.cdlivro) qtdvvenda'+
                    ',(select sum(compra.QTITEMENTRADA) '+
                      'from itlivro compra '+
                      'where compra.cdempresa=l.cdempresa and compra.dsespecie=''NF'' AND compra.cdproduto=p.cdproduto and compra.cdlivro=l.cdlivro) qtcompra'+
                    ',(select sum(itC.QTSAIPROPRIO) from itlivro itC where ITC.dsespecie=''CONSU'' AND itC.cdproduto=p.cdproduto and itC.cdlivro=l.cdlivro) qtconsumo '+
              'from livro l '+
              'inner join livroproduto lp on l.cdlivro=lp.cdlivro and l.cdempresa=lp.cdempresa '+
              'inner join PRODUTO p on P.cdproduto=lp.cdproduto and p.cdempresa=lp.cdempresa '+
              'inner join grupo g on g.cdgrupo=P.cdgrupo and g.cdempresa=p.cdempresa '+
              'where lp.cdempresa='+empresa.cdempresa.tostring+' and lp.CDLIVRO='+cdlivro.tostring;
  end;
var
  c : Tfdquery;
begin
  c := Tfdquery.Create  (nil);
  frmLivroProducaoImprimir := TfrmLivroProducaoImprimir.Create(application);
  try
    c.Connection := aplicacao.confire;
    c.sql.text   := makesql;
    c.Open;
    with frmLivroProducaoImprimir do
    begin
      //lblnmempresa.Caption   := empresa.nmempresa;
      //lblmesperiodo.Caption  := UpperCase(FormatDateTime('mmmm/yyyy', qregistro.DatadoCodigo(_livro, cdlivro, _dtinicio)));
      //lbldata.Caption        := UpperCase(FormatDateTime('mmmm/yyyy', qregistro.DatadoCodigo(_livro, cdlivro, _dtinicio)));
      dtsmovproducao.DataSet := c;
      if LowerCase(mp) = _mp then
      begin
        frx1.ShowReport
      end
      else
      begin
        frxmovproducao.ShowReport;
      end;
      result := true;
    end;
  finally
    freeandnil(c);
    freeandnil(frmLivroProducaoImprimir);
  end;
end;

procedure TfrmLivroProducaoImprimir.rptTermoAberturaBeforePrint(Sender: TObject);
begin
  {
  if VarIsNull(ppnmresponsavel.FieldValue) then
  begin
    MessageDlg('Nome do Responsável não está preenchido no Cadastro=>Empresa.', mtInformation, [mbOK], 0);
    Abort;
  end;
  lblresponsavelabertura.Caption := 'RESPONSÁVEL: '+ppnmresponsavel.FieldValue;
  if VarIsNull(ppnucpf.FieldValue) then
  begin
    MessageDlg('Número do CPF do Responsável não está preenchido no Cadastro=>Empresa.', mtInformation, [mbOK], 0);
    Abort;
  end;
  lblcpfabertura.Caption         := 'CPF: '+ppnucpf.FieldValue;
  }
end;

procedure TfrmLivroProducaoImprimir.rptLivroImprimirStartPage(Sender: TObject);
begin
  //pplblnupagina.Caption := IntToStr(rptLivroImprimir.AbsolutePageNo + nupagina - 1);
end;

procedure TfrmLivroProducaoImprimir.rptLivroImprimirA3StartPage(Sender: TObject);
begin
  //pplblnupaginaA3.Caption := 'Folha '+ IntToStr(TppReport(sender).AbsolutePageNo +  nupagina - 1);
end;

end.
