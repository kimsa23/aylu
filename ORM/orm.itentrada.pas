unit orm.itentrada;

interface

uses Contnrs, Data.DB, Vcl.Forms, System.SysUtils, System.Classes,
  uConstantes,
  Dialogo.Progressbar,
  ORM.Produto, ORM.Empresa,
  Rotina.Rotinas, Rotina.Retornasql,
  classe.query, Classe.DAO;

type
  TITentrada = class(TRegistroQuipos)
  private
    Fborecuperaajusteicms: String;
    Fbobaseipiajuste: String;
    Fborecuperapis: String;
    Fboicmsajuste: String;
    Fbobasepisajuste: String;
    Fborecuperaipiespecial: String;
    Fboajustetotal: String;
    Fbodiferencialaliquota: String;
    Fbobaseicmsajuste: String;
    Fborecuperaicms: String;
    Fborecuperaipi: String;
    Fboajusteipi: String;
    Fborecuperacofins: String;
    Fbondiferencialaliquota: String;
    Fbobasecofinsajuste: String;
    Fvloutdespesa: currency;
    Fvlvenda: currency;
    Fvllucroprazo: currency;
    Fvlseguro: currency;
    Fvlbaseicmssubtrib: currency;
    Fvlicmsred: currency;
    Fvlpis: currency;
    Fvlbaseicms: currency;
    Fvlcustobruto: currency;
    Fvlicmsdifaliquotaitem: currency;
    Fvlprecoprazoanterior: currency;
    Fvlfrete: currency;
    Fvlcustototal: currency;
    Fvlicms: currency;
    Fvlcomissao: currency;
    Fvlicmsdifaliquota: currency;
    Fvlprecoanterior: currency;
    Fvlprecoprazo: currency;
    Fvllucro: currency;
    Fvlsupersimples: currency;
    Fvlespecial: currency;
    Fvlcofins: currency;
    Fvlatacado: currency;
    Fvlbasecofins: currency;
    Fvlunitario: currency;
    Fvldescontoitem: currency;
    Fvlcustomedio: currency;
    Fvlicmssubtribitem: currency;
    Fvlbaseipi: currency;
    Fvldesconto: currency;
    Fvltotal: currency;
    Fvlipiitem: currency;
    Fvlprecovenda: currency;
    Fvlcusto: currency;
    Fvldespesaitem: currency;
    Fvlipi: currency;
    Fvlsaldovalor: currency;
    Fvlicmssubtrib: currency;
    Fvlfreteitem: currency;
    Fvlbasepis: currency;
    Fvloutdespesaitem: currency;
    Fvlcustoliquido: currency;
    Fprcomissao: double;
    Fprlucroatacado: double;
    Fprdesconto: double;
    Falicmsred: double;
    Falsupersimples: double;
    Fpsliquido: double;
    Fprredbcicms: double;
    Falicms: double;
    Fpsbruto: double;
    Falipi: double;
    Fprvigor: double;
    Falcofins: double;
    Falpis: double;
    Fprlucroprazo: double;
    Fqtitem: double;
    Fprlucroespecial: double;
    Fprlucro: double;
    Falicmssubtrib: double;
    Fprmrgvladicionadoicmssubtrib: double;
    Fprcusto: double;
    Fprfrete: double;
    Fprdespesaitem: double;
    Fcdmodbcsticms: integer;
    Fcdproduto: integer;
    Fcditentrada: integer;
    Fcdplconta: integer;
    Fcdordproducao: integer;
    Fcdmodbcicms: integer;
    Fcdentrada: integer;
    Fcdordcompra: integer;
    Fcdcfop: integer;
    Fcdcntcusto: integer;
    Fcditordcompra: integer;
    Fdsitentrada: string;
    Fboalteracustomedio: string;
    Fcddigitado: string;
    Fnustpis: string;
    Fnusticms: string;
    Fcdbccalculocredito: string;
    Fnustcofins: string;
    Fnuplconta: string;
    Fnustipi: string;
    Fdsinfadicional: string;
    Fdtfabricacao: TDate;
    Fdtvalidade: TDate;
    Fnucntcusto: string;
    Fvlretencao: currency;
    fvltotalcompleto: currency;
    fvlbaseicmsntributavel: currency;
    fvlbaseicmsoriginal: currency;
    fvlbaseicmred: currency;
    fproduto: tproduto;
  public
    property produto : tproduto read fproduto write fproduto;
    [fk]
    property cdentrada : integer read Fcdentrada write Fcdentrada;
    [fk]
    property cdproduto : integer read Fcdproduto write Fcdproduto;
    [fk]
    property cdcntcusto : integer read Fcdcntcusto write Fcdcntcusto;
    property nucntcusto : string read Fnucntcusto write Fnucntcusto;
    [fk]
    property cdcfop : integer read Fcdcfop write Fcdcfop;
    property cddigitado : string read Fcddigitado write Fcddigitado;
    property dsitentrada : string read Fdsitentrada write Fdsitentrada;
    property boalteracustomedio : string read Fboalteracustomedio write Fboalteracustomedio;
    property qtitem : double read Fqtitem write Fqtitem;
    property vlunitario : currency read Fvlunitario write Fvlunitario;
    property vltotal : currency read Fvltotal write Fvltotal;
    property prdesconto : double read Fprdesconto write Fprdesconto;
    property vldesconto : currency read Fvldesconto write Fvldesconto;
    property vlbaseicms : currency read Fvlbaseicms write Fvlbaseicms;
    property alicms : double read Falicms write Falicms;
    property vlicms : currency read Fvlicms write Fvlicms;
    property alicmsred : double read Falicmsred write Falicmsred;
    property vlbaseipi : currency read Fvlbaseipi write Fvlbaseipi;
    property alipi : double read Falipi write Falipi;
    property vlipi : currency read Fvlipi write Fvlipi;
    property vlfrete : currency read Fvlfrete write Fvlfrete;
    property vlseguro : currency read Fvlseguro write Fvlseguro;
    property psliquido : double read Fpsliquido write Fpsliquido;
    property psbruto : double read Fpsbruto write Fpsbruto;
    property borecuperaicms : string read Fborecuperaicms write Fborecuperaicms;
    property borecuperaipi : string read Fborecuperaipi write Fborecuperaipi;
    property borecuperapis : string read Fborecuperapis write Fborecuperapis;
    property vlbasepis : currency read Fvlbasepis write Fvlbasepis;
    property alpis : double read Falpis write Falpis;
    property vlpis : currency read Fvlpis write Fvlpis;
    property vlbasecofins : currency read Fvlbasecofins write Fvlbasecofins;
    property alcofins : double read Falcofins write Falcofins;
    property vlcofins : currency read Fvlcofins write Fvlcofins;
    property prcusto : double read Fprcusto write Fprcusto;
    property prvigor : double read Fprvigor write Fprvigor;
    property vloutdespesa : currency read Fvloutdespesa write Fvloutdespesa;
    property vlcustomedio : currency read Fvlcustomedio write Fvlcustomedio;
    property vlcusto : currency read Fvlcusto write Fvlcusto;
    property borecuperacofins : string read Fborecuperacofins write Fborecuperacofins;
    property dtfabricacao : TDate read Fdtfabricacao write Fdtfabricacao;
    property dtvalidade : TDate read Fdtvalidade write Fdtvalidade;
    property vlsaldovalor : currency read Fvlsaldovalor write Fvlsaldovalor;
    property prlucro : double read Fprlucro write Fprlucro;
    property vlicmsred : currency read Fvlicmsred write Fvlicmsred;
    property alicmssubtrib : double read Falicmssubtrib write Falicmssubtrib;
    property vlicmssubtrib : currency read Fvlicmssubtrib write Fvlicmssubtrib;
    property vlbaseicmssubtrib : currency read Fvlbaseicmssubtrib write Fvlbaseicmssubtrib;
    property vlvenda : currency read Fvlvenda write Fvlvenda;
    property prlucroatacado : double read Fprlucroatacado write Fprlucroatacado;
    property prlucroespecial : double read Fprlucroespecial write Fprlucroespecial;
    property vlatacado : currency read Fvlatacado write Fvlatacado;
    property vlespecial : currency read Fvlespecial write Fvlespecial;
    [fk]
    property cdmodbcicms : integer read Fcdmodbcicms write Fcdmodbcicms;
    [fk]
    property cdmodbcsticms : integer read Fcdmodbcsticms write Fcdmodbcsticms;
    property prmrgvladicionadoicmssubtrib : double read Fprmrgvladicionadoicmssubtrib write Fprmrgvladicionadoicmssubtrib;
    property prredbcicms : double read Fprredbcicms write Fprredbcicms;
    property nusticms : string read Fnusticms write Fnusticms;
    property nustipi : string read Fnustipi write Fnustipi;
    property nustcofins : string read Fnustcofins write Fnustcofins;
    property nustpis : string read Fnustpis write Fnustpis;
    property borecuperaajusteicms : string read Fborecuperaajusteicms write Fborecuperaajusteicms;
    property boicmsajuste : string read Fboicmsajuste write Fboicmsajuste;
    property bobaseipiajuste : string read Fbobaseipiajuste write Fbobaseipiajuste;
    property boajustetotal : string read Fboajustetotal write Fboajustetotal;
    property bobaseicmsajuste : string read Fbobaseicmsajuste write Fbobaseicmsajuste;
    property bondiferencialaliquota : string read Fbondiferencialaliquota write Fbondiferencialaliquota;
    property vlicmsdifaliquota : currency read Fvlicmsdifaliquota write Fvlicmsdifaliquota;
    property bodiferencialaliquota : string read Fbodiferencialaliquota write Fbodiferencialaliquota;
    [keyfield]
    property cditentrada : integer read Fcditentrada write Fcditentrada;
    property borecuperaipiespecial : string read Fborecuperaipiespecial write Fborecuperaipiespecial;
    [fk]
    property cditordcompra : integer read Fcditordcompra write Fcditordcompra;
    [fk]
    property cdordcompra : integer read Fcdordcompra write Fcdordcompra;
    property bobasepisajuste : string read Fbobasepisajuste write Fbobasepisajuste;
    property bobasecofinsajuste : string read Fbobasecofinsajuste write Fbobasecofinsajuste;
    property vlcustobruto : currency read Fvlcustobruto write Fvlcustobruto;
    property vlcustoliquido : currency read Fvlcustoliquido write Fvlcustoliquido;
    property prcomissao : double read Fprcomissao write Fprcomissao;
    property alsupersimples : double read Falsupersimples write Falsupersimples;
    property vlsupersimples : currency read Fvlsupersimples write Fvlsupersimples;
    property vlcomissao : currency read Fvlcomissao write Fvlcomissao;
    property vlcustototal : currency read Fvlcustototal write Fvlcustototal;
    property vlprecovenda : currency read Fvlprecovenda write Fvlprecovenda;
    property vlprecoanterior : currency read Fvlprecoanterior write Fvlprecoanterior;
    property prfrete : double read Fprfrete write Fprfrete;
    property vlipiitem : currency read Fvlipiitem write Fvlipiitem;
    property vlfreteitem : currency read Fvlfreteitem write Fvlfreteitem;
    property vlicmssubtribitem : currency read Fvlicmssubtribitem write Fvlicmssubtribitem;
    property vldescontoitem : currency read Fvldescontoitem write Fvldescontoitem;
    property vloutdespesaitem : currency read Fvloutdespesaitem write Fvloutdespesaitem;
    property vlicmsdifaliquotaitem : currency read Fvlicmsdifaliquotaitem write Fvlicmsdifaliquotaitem;
    [fk]
    property cdbccalculocredito : string read Fcdbccalculocredito write Fcdbccalculocredito;
    property prdespesaitem : double read Fprdespesaitem write Fprdespesaitem;
    property vldespesaitem : currency read Fvldespesaitem write Fvldespesaitem;
    property vllucro : currency read Fvllucro write Fvllucro;
    property dsinfadicional : string read Fdsinfadicional write Fdsinfadicional;
    [fk]
    property cdplconta : integer read Fcdplconta write Fcdplconta;
    [fk]
    property cdordproducao : integer read Fcdordproducao write Fcdordproducao;
    property nuplconta : string read Fnuplconta write Fnuplconta;
    property vlprecoprazo : currency read Fvlprecoprazo write Fvlprecoprazo;
    property prlucroprazo : double read Fprlucroprazo write Fprlucroprazo;
    property vlprecoprazoanterior : currency read Fvlprecoprazoanterior write Fvlprecoprazoanterior;
    property vllucroprazo : currency read Fvllucroprazo write Fvllucroprazo;
    property boajusteipi : string read Fboajusteipi write Fboajusteipi;
    property vlretencao : currency read Fvlretencao write Fvlretencao;
    property vlbaseicmsntributavel : currency read fvlbaseicmsntributavel write fvlbaseicmsntributavel;
    property vlbaseicmsoriginal : currency read fvlbaseicmsoriginal write fvlbaseicmsoriginal;
    property vlbaseicmsred : currency read fvlbaseicmred write fvlbaseicmred;
    property vltotalcompleto : currency read fvltotalcompleto write fvltotalcompleto;
    function VlTotalGeral:currency;
    constructor create;
    destructor destroy; override;
  end;
  TItEntradaList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TItEntrada;
    procedure SetItem(Index: Integer; const Value: TItEntrada);
  public
    function New: TItEntrada;
    property Items[Index: Integer]: TItEntrada read GetItem write SetItem;
    function Ler(codigo:Integer):Boolean;overload;
    function Ler(Dataset: TDataset):Boolean;overload;
    function Ler(sqlwhere:string):boolean;overload;
    procedure VerificarRecuperaoImposto(dataset: TDataset);
    procedure CalcularImpostoIcmsItem;
    class procedure RecalcularBaseICMSnaoTributavel;
  end;

implementation

procedure TItEntradaList.CalcularImpostoIcmsItem;
var
  vlbaseicms : real;
  I: Integer;
  q : tclassequery;
begin
  frmprogressbar := tfrmprogressbar.Create(nil);
  try
    frmprogressbar.gau.MaxValue := count;
    frmprogressbar.Show;
    for I := 0 to count-1 do
    begin
      frmprogressbar.gau.Progress := i + 1;
      frmprogressbar.pnl.Caption := 'Recalculando Base ICMS não tributável - Compra - Registro '+frmprogressbar.gau.Progress.ToString+' de '+frmprogressbar.gau.MaxValue.ToString;
      application.ProcessMessages;
      q := tclassequery.create('select tpentrada.boicms,entrada.boipibcicms,entrada.boarredondar '+
                               'from entrada '+
                               'inner join tpentrada on tpentrada.cdempresa=entrada.cdempresa and tpentrada.cdtpentrada=entrada.cdtpentrada '+
                               'where entrada.cdempresa='+items[i].cdempresa.tostring+' and entrada.cdentrada='+inttostr(items[i].cdentrada));
      try
        if (q.q.FieldByName(_boicms).AsString <> _s) or (items[i].alicms = 0) or (items[i].alicms <= 0) then
        begin
          items[i].vlbaseicmsntributavel := 0;
          items[i].vlbaseicmsoriginal := 0;
        end
        else
        begin
          vlbaseicms := items[i].vltotal - items[i].vldesconto + items[i].vloutdespesa + items[i].vlseguro + items[i].vlfrete;
          if q.q.FieldByName(_boipibcicms).asstring = _S then
          begin
            vlbaseicms := vlbaseicms + items[i].vlipi;
          end;
          vlbaseicms := QRotinas.Roundqp(vlbaseicms, q.q.FieldByName(_boarredondar).asstring=_S);
          items[i].vlbaseicmsoriginal := vlbaseicms;
          items[i].vlbaseicmsntributavel := items[i].vlbaseicmsoriginal - items[i].vlbaseicms;
        end;
      finally
        freeandnil(q);
      end;
      items[i].Update;
    end;
  finally
    freeandnil(frmprogressbar);
  end;
end;

function TItEntradaList.GetItem(Index: Integer): TItEntrada;
begin
  Result := TItEntrada(Inherited Items[Index]);
end;

function TItEntradaList.Ler(Dataset: TDataset): Boolean;
begin
  clear;
  result := False;
  dataset.First;
  while not dataset.Eof do
  begin
    new.select(dataset);
    dataset.Next;
    result := True;
  end;
end;

function TItEntradaList.Ler(codigo: Integer): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_itEntrada, codigo, _cdEntrada));
  try
    clear;
    result := q.q.RecordCount > 0;
    if not result then
    begin
      Exit;
    end;
    while not q.q.Eof do
    begin
      new.select(q.q);
      q.q.Next;
    end;
  finally
    FreeAndNil(q);
  end;
end;

function TItEntradaList.New: TItEntrada;
begin
  Result := TItEntrada.Create;
  Add(Result);
end;

class procedure TItEntradaList.RecalcularBaseICMSnaoTributavel;
var
  itentrada : titentradalist;
begin
  itentrada := titentradalist.Create;
  try
    itentrada.Ler(_alicmsred+'>'+_0);
    itentrada.CalcularImpostoIcmsItem;
  finally
    freeandnil(itentrada);
  end;
end;

procedure TItEntradaList.SetItem(Index: Integer; const Value: TItEntrada);
begin
  Put(Index, Value);
end;

{function TItEntradaList.sql_insert: string;
var
  i : Integer;
begin
  Result := '';
  for i := 0 to count-1 do
  begin
    if Items[i].state = dsinsert then
    begin
      result := result + titEntradadao.Insert(Items[i], true)+#13;
    end;
  end;
end;}

procedure TItEntradaList.VerificarRecuperaoImposto(dataset: TDataset);
var
  I: Integer;
begin
  if empresa.tpregime = _s then
  begin
    exit;
  end;
  for I := 0 to count -1 do
  begin
    if (items[i].cdcfop = 1201) and (items[i].borecuperaipi <> _s) then
    begin
      items[i].borecuperaipi := _s;
      if dataset.Locate(_cditentrada, items[i].cditentrada, []) then
      begin
        dataset.Edit;
        dataset.FieldByName(_borecuperaipi).AsString := _s;
        dataset.Post;
      end;
    end;
  end;
end;

function TItEntradaList.Ler(sqlwhere: string): boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_where(_itentrada, sqlwhere));
  try
    result := Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

{ TITentrada }

constructor TITentrada.create;
begin
  inherited;
  fproduto := tproduto.create;
end;

destructor TITentrada.destroy;
begin
  freeandnil(fproduto);
  inherited;
end;

function TITentrada.VlTotalGeral: currency;
begin
  result := vltotal + vlicmssubtrib + vlipi + vlfrete - vldesconto;
end;

end.
