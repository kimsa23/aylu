unit ORM.Equipamento;

interface

uses
  forms, graphics, Dialogs, classes, sysutils, ComCtrls, Controls, data.db,
  sqlexpr,
  cxRichEdit,
  rotina.strings, dialogo.progressbar, uConstantes, rotina.Registro,
  classe.aplicacao, orm.empresa, classe.executasql, rotina.retornasql, orm.TpEquipamento,
  classe.query, classe.dao;

type
  TEquipamento = class(TRegistroQuipos)
  private
    Ftpequipamento: TTpequipamento;
    Fboclienteproprietarioaviso: String;
    Fbopertenceempresa: String;
    Fbomedidor: String;
    Fboapontamentosimultaneo: String;
    Fvlequipamento: Currency;
    Fvlhora: Currency;
    Fvlcompra: Currency;
    Fidsetor: Double;
    Fqtvelocidade: Double;
    Fcdcor: Integer;
    Fnuposicao: Integer;
    Fnuano: Integer;
    Fcdsetor: Integer;
    Fcdstequipamento: Integer;
    Fcdmarca: Integer;
    Fcdtpeletricpneum: Integer;
    Fcdtpequipamento: Integer;
    Fcdcontrato: Integer;
    Fcdmodelo: Integer;
    Fqtsaldo: Integer;
    Fqtitem: Integer;
    Fcdvsoftbasico: Integer;
    Fnudiapreventiva: Integer;
    Fnuordseq: Integer;
    Fcdproduto: Integer;
    Fcdequipamento: Integer;
    Fcdequipamentoantigo: Integer;
    Fnuidentcliente: string;
    Fnufabricacao: string;
    Fnmequipamento: string;
    Fnmrevendedor: string;
    Fdsobservacao: string;
    Fcdfornecedor: LargeInt;
    Fnupatrimonio: string;
    Fnuserie: string;
    Fnuhomologatorio: string;
    Fdsjustificativastatus: string;
    Fnucertificadogarantia: string;
    Fimfoto: string;
    Fcdcliente: LargeInt;
    Fcdfabricacao: string;
    Fnuvsoftbasico: string;
    Fnulsoftbasico: string;
    Fnunf: string;
    Fdsmodelo: string;
    Fdthomologario: TDate;
    Fdtfabricacao: TDate;
    Fdtcompra: TDate;
    Fhrtempoagenda: TTime;
    fnuplaca: string;
    Fcdtpequipamento2: integer;
    fcdcntcusto: integer;
    fnucntcusto: string;
  public
    [keyfield]
    property cdequipamento : Integer read Fcdequipamento write fcdequipamento;
    [fk]
    property cdtpequipamento2 : integer read Fcdtpequipamento2 write Fcdtpequipamento2;
    [fk]
    property cdmodelo : Integer read Fcdmodelo write fcdmodelo;
    [fk]
    property cdvsoftbasico : Integer read Fcdvsoftbasico write fcdvsoftbasico;
    [fk]
    property cdtpequipamento : Integer read Fcdtpequipamento write fcdtpequipamento;
    [fk]
    property cdcontrato : Integer read Fcdcontrato write fcdcontrato;
    [fk]
    property cdmarca : Integer read Fcdmarca write fcdmarca;
    [fk]
    property cdfornecedor : LargeInt read Fcdfornecedor write fcdfornecedor;
    [fk]
    property cdstequipamento : Integer read Fcdstequipamento write fcdstequipamento;
    [fk]
    property cdcor : Integer read Fcdcor write fcdcor;
    [fk]
    property cdtpeletricpneum : Integer read Fcdtpeletricpneum write fcdtpeletricpneum;
    [fk]
    property cdproduto : Integer read Fcdproduto write fcdproduto;
    [fk]
    property cdsetor : Integer read Fcdsetor write fcdsetor;
    property nmequipamento : string read Fnmequipamento write fnmequipamento;
    property nuidentcliente : string read Fnuidentcliente write fnuidentcliente;
    property nupatrimonio : string read Fnupatrimonio write fnupatrimonio;
    property nudiapreventiva : Integer read Fnudiapreventiva write fnudiapreventiva;
    property nunf : string read Fnunf write fnunf;
    property dtcompra : TDate read Fdtcompra write fdtcompra;
    property vlcompra : Currency read Fvlcompra write fvlcompra;
    property nuhomologatorio : string read Fnuhomologatorio write fnuhomologatorio;
    property dthomologario : TDate read Fdthomologario write fdthomologario;
    property nufabricacao : string read Fnufabricacao write fnufabricacao;
    property nuordseq : Integer read Fnuordseq write fnuordseq;
    property nuvsoftbasico : string read Fnuvsoftbasico write fnuvsoftbasico;
    property nulsoftbasico : string read Fnulsoftbasico write fnulsoftbasico;
    property nuserie : string read Fnuserie write fnuserie;
    property dsmodelo : string read Fdsmodelo write fdsmodelo;
    property nuano : Integer read Fnuano write fnuano;
    property nucertificadogarantia : string read Fnucertificadogarantia write fnucertificadogarantia;
    property dtfabricacao : TDate read Fdtfabricacao write fdtfabricacao;
    property nmrevendedor : string read Fnmrevendedor write fnmrevendedor;
    property vlequipamento : Currency read Fvlequipamento write fvlequipamento;
    property bopertenceempresa : String read Fbopertenceempresa write fbopertenceempresa;
    property idsetor : Double read Fidsetor write fidsetor;
    property nuposicao : Integer read Fnuposicao write fnuposicao;
    property dsobservacao : string read Fdsobservacao write fdsobservacao;
    property imfoto : string read Fimfoto write fimfoto;
    property bomedidor : String read Fbomedidor write fbomedidor;
    property cdfabricacao : string read Fcdfabricacao write fcdfabricacao;
    property vlhora : Currency read Fvlhora write fvlhora;
    property cdequipamentoantigo : Integer read Fcdequipamentoantigo write fcdequipamentoantigo;
    property boapontamentosimultaneo : String read Fboapontamentosimultaneo write fboapontamentosimultaneo;
    property qtitem : Integer read Fqtitem write fqtitem;
    [AObrigatorio]
    property qtsaldo : Integer read Fqtsaldo write fqtsaldo;
    property hrtempoagenda : TTime read Fhrtempoagenda write fhrtempoagenda;
    [fk]
    property cdcliente : LargeInt read Fcdcliente write fcdcliente;
    property dsjustificativastatus : string read Fdsjustificativastatus write fdsjustificativastatus;
    property boclienteproprietarioaviso : String read Fboclienteproprietarioaviso write fboclienteproprietarioaviso;
    property qtvelocidade : Double read Fqtvelocidade write fqtvelocidade;
    property nuplaca : string read fnuplaca write fnuplaca;
    [fk]
    property cdcntcusto: integer read fcdcntcusto write fcdcntcusto;
    property nucntcusto: string read fnucntcusto write fnucntcusto;
    property tpequipamento : TTpequipamento read Ftpequipamento write Ftpequipamento;
    constructor create;
    destructor destroy;override;
    function ExistePatrimonioRepetidoEmpresa(cdequipamento, nupatrimonio:string):boolean;
    function Novo(cdcliente, nuserie, nupatrimonio, cdtpequipamento, cdmarca, cdmodelo, cdcor:string): integer;
    function setrce(tbl: string; cdtpordserv:integer; var rce: TcxRichEdit):boolean;
    function AcrescentarSaldo(codigo: integer; qtacrescimo : integer; boscript:boolean=false):string;
  end;

implementation

uses novo.equipamento;

function TEquipamento.AcrescentarSaldo(codigo, qtacrescimo: integer; boscript: boolean): string;
begin
  Select(codigo);
  qtsaldo:= qtsaldo + qtacrescimo;
  result := Update(boscript);
end;

constructor TEquipamento.create;
begin
  inherited;
  ftpequipamento := Ttpequipamento.create;
end;

function TEquipamento.ExistePatrimonioRepetidoEmpresa(cdequipamento, nupatrimonio:string):boolean;
begin
  result := RetornaSQLInteger('select count(*) from equipamento where cdempresa='+empresa.cdempresa.tostring+' and bopertenceempresa=''S'' and cdequipamento<>'+cdequipamento+' and nupatrimonio='+quotedstr(nupatrimonio)) > 0;
end;

function TEquipamento.Novo(cdcliente, nuserie, nupatrimonio, cdtpequipamento, cdmarca, cdmodelo, cdcor:string): integer;
begin
  result := equipamento_novo(cdcliente, nuserie, nupatrimonio, cdtpequipamento, cdmarca, cdmodelo, cdcor);
end;

function TEquipamento.setrce(tbl: string; cdtpordserv: integer; var rce: TcxRichEdit):boolean;
var
  q : TClasseQuery;
  layout : TStrings;
  k, x, i : integer;
  a1, a2, atributo, linha, valor : string;
  function GetValor(texto:string):string;
  var
    direcao : string;
    tam : integer;
  begin
    result := '';
    if copy(texto, 2, 25) = 'equipamento.numero_serie(' then
    begin
      if nuserie <> '' then
      begin
        direcao := copy(texto, 27, 1);
        tam     := StrToInt(copy(texto, 29, length(texto) - 30));
        result  := FormatarTexto(copy(nuserie, 1, tam), direcao, tam);
      end;
    end
    else if copy(texto, 2, 19) = 'equipamento.dt_fab(' then
    begin
      if dtfabricacao <> 0 then
      begin
        direcao := copy(texto, 21, 1);
        tam     := StrToInt(copy(texto, 23, length(texto) - 24));
        result  := FormatarTexto(copy(GetDtBanco(dtfabricacao), 1, tam), direcao, tam);
      end;
    end
    else if copy(texto, 2, 19) = 'equipamento.cd_fab(' then
    begin
      if cdfabricacao <> '' then
      begin
        direcao := copy(texto, 21, 1);
        tam     := StrToInt(copy(texto, 23, length(texto) - 24));
        result  := FormatarTexto(copy(cdfabricacao, 1, tam), direcao, tam);
      end;
    end
    else if copy(texto, 2, 30) = 'equipamento.numero_patrimonio(' then
    begin
      if nupatrimonio <> '' then
      begin
        direcao := copy(texto, 32, 1);
        tam     := StrToInt(copy(texto, 34, length(texto) - 35));
        result  := FormatarTexto(copy(nupatrimonio, 1, tam), direcao, tam);
      end;
    end
    else if copy(texto, 2, 23) = 'equipamento.numero_ano(' then
    begin
      if nuano <> 0 then
      begin
        direcao := copy(texto, 25, 1);
        tam     := StrToInt(copy(texto, 27, length(texto) - 28));
        result  := FormatarTexto(copy(IntToStr(nuano), 1, tam), direcao, tam);
      end;
    end
    else if copy(texto, 2, 21) = 'tipoequipamento.nome(' then
    begin
      if tpequipamento.nmtpequipamento <> '' then
      begin
        direcao := copy(texto, 23, 1);
        tam     := StrToInt(copy(texto, 25, length(texto) - 26));
        result  := FormatarTexto(copy(tpequipamento.nmtpequipamento, 1, tam), direcao, tam);
      end;
    end
    else if copy(texto, 2, 12) = 'modelo.nome(' then
    begin
      if cdmodelo <> 0 then
      begin
        direcao := copy(texto, 14, 1);
        tam     := StrToInt(copy(texto, 16, length(texto) - 17));
        result  := FormatarTexto(copy(qregistro.NomedoCodigo(_modelo, cdmodelo), 1, tam), direcao, tam);
      end;
    end
    else if copy(texto, 2, 11) = 'marca.nome(' then
    begin
      if cdmarca <> 0 then
      begin
        direcao := copy(texto, 13, 1);
        tam     := StrToInt(copy(texto, 15, length(texto) - 16));
        result  := FormatarTexto(copy(qregistro.NomedoCodigo(_marca, cdmarca), 1, tam), direcao, tam);
      end;
    end
    else if copy(texto, 2, 29) = 'tipoeletricopneumatrico.nome(' then
    begin
      if cdtpeletricpneum <> 0 then
      begin
        direcao := copy(texto, 31, 1);
        tam     := StrToInt(copy(texto, 33, length(texto) - 34));
        result  := FormatarTexto(copy(qregistro.NomedoCodigo(_tpeletricpneum, cdtpeletricpneum), 1, tam), direcao, tam);
      end;
    end
    else if copy(texto, 2, 9) = 'cor.nome(' then
    begin
      if cdcor <> 0 then
      begin
        direcao := copy(texto, 11, 1);
        tam     := StrToInt(copy(texto, 13, length(texto) - 14));
        result  := FormatarTexto(copy(qregistro.NomedoCodigo(_cor, cdcor), 1, tam), direcao, tam);
      end;
    end
    else if copy(texto, 2, 29) = 'equipamento.nome_revendedor('   then
    Begin
      direcao := copy(texto, 31, 1)
    End
    else if copy(texto, 2, 30) = 'equipamento.numero_notafiscal(' then
    begin
      direcao := copy(texto, 32, 1)
    end
    else if copy(texto, 2, 24) = 'equipamento.data_compra('       then
    begin
      direcao := copy(texto, 26, 1);
    end;
  end;
begin
  rce.Clear;
  if (cdequipamento = 0) or (cdtpordserv = 0) then
  begin
    result := False;
    exit;
  end;
  q      := TClasseQuery.create;
  layout := tstringlist.create;
  try
    q.q.open('select dslayoutequipamento from tp'+tbl+' where cdempresa='+empresa.cdempresa.tostring+' and cdtp'+tbl+'='+inttostr(cdtpordserv));
    if q.q.fieldbyname(_dslayoutequipamento).isnull then
    begin
      result := False;
      exit;
    end;
    layout.Text  := q.q.fieldbyname(_dslayoutequipamento).AsString;
    if RetornaSQLInteger('select count(*) from equipamento where cdempresa='+empresa.cdempresa.tostring+' and cdequipamento='+inttostr(cdequipamento)) = 0 then
    begin
      result := False;
      exit;
    end;
    Select(cdequipamento);
    tpequipamento.Select(cdtpequipamento);
    i := 0;
    k := 0;
    Atributo := '';
    repeat
      linha := layout[i];
      if (linha = '') then
      begin
        rce.SelText := #13
      end
      else
      begin
        valor := '';
        for x := 1 to length(linha) do
        begin
          a1 := linha[x];
          if a1 = '<' then
          begin
            k := x
          end
          else if a1 = '>' then
          begin
            a2 := getValor(copy(linha, k, x-k+1));
            if a2 <> '' then
            begin
              rce.selattributes.Color := clblack;
              rce.SelText             := Atributo;
              rce.SelAttributes.Color := clblue;
              rce.SelText             := getValor(copy(linha, k, x-k+1));
            end;
            Atributo := '';
            k := 0;
          end
          else if k = 0 then
          begin
            Atributo := Atributo + a1;
          end;
        end;
        rce.SelText := #13;
      end;
      i := i + 1;
    until i >= layout.count;
    result := True;
  finally
    freeandnil(q);
    freeandnil(layout);
  end;
end;

destructor TEquipamento.destroy;
begin
  FreeAndNil(ftpequipamento);
end;

end.
