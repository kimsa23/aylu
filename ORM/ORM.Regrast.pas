unit ORM.Regrast;

interface

uses
  system.Classes,
  SysUtils, Contnrs,
  DBClient, db,
  uConstantes, rotina.Registro, rotina.strings,
  rotina.retornasql, orm.empresa, classe.aplicacao, classe.dao, classe.query, orm.cliente,
  orm.fornecedor, orm.itregrast;

type
  TRegraSTRecord = record
    cdcfopduf : integer;
    cdcfopfuf : integer;
    cdcfopdufsubtrib : integer;
    cdcfopfufsubtrib : integer;
    cduf : integer;
    tpregime: string;
    tpentsai : string;
  end;
  TRegraST = class(TRegistroQuipos)
  private
    Fnmregrast: string;
    Fitregrast: titregrastlist;
    Fcdregrast: integer;
    function MakesqlRegraST(codigo:integer):string;
    function ObterCdRegraST(codigo:integer):integer;
    function ObterCdUF(cduf:integer):integer;
    function makesql(cditregrast:integer; cduf:string=''):string;
    function EncontrouRegraST(cdcfop, cdregrast: integer; st: string): string;
    procedure AtribuirInformacaoDetalhe(cdsdetail: TDataset; i: integer);
    function ObterCFOP(var nusticms : string; cdsdetail: TDataset; registro : TRegraSTRecord): integer;
    function ObterCFOPII(cduf, cdcfopdentro, cdcfopfora: integer): integer;
    function AlgumCFOPPreenchido(registro : TRegraSTRecord): boolean;
    function SomenteCFOPNormalPreenchido(registro : TRegraSTRecord): boolean;
    function SomenteCFOPSubTribPreenchido(registro : TRegraSTRecord): boolean;
    function STICMSdoProdutoEhSubTrib(cdproduto: integer): boolean;
  public
    property itregrast : titregrastlist read Fitregrast write fitregrast;
    [keyfield]
    property cdregrast : integer read Fcdregrast write fcdregrast;
    property nmregrast : string read Fnmregrast write fnmregrast;
    function GetST(tbl: string; cdproduto, cdcfop: integer; st:string):string;
    function GetRegraSTPedidoOrcamento(cdsdetail: TClientDataSet; cdufcliente: integer; tpregime:string):boolean;overload;
    function GetRegraST(cdsdetail: TDataSet; registro : TRegraSTRecord):boolean;
    constructor Create;
    destructor destroy; override;
  end;

implementation

destructor TRegraST.destroy;
begin
  freeandnil(fitregrast);
  inherited;
end;

constructor TRegraST.Create;
begin
  inherited;
  fitregrast := titregrastlist.Create;
end;

function TRegraST.ObterCdUF(cduf:integer): integer;
begin
  result := cduf;
  if result = 0 then
  begin
    result := empresa.endereco.cduf;
  end;
end;

function TRegraST.makesql(cditregrast: integer; cduf: string): string;
begin
  result := _cditregrast+'='+inttostr(cditregrast);
  if cduf <> '' then
  begin
    result := result + ' and cduf='+cduf;
  end;
end;

function TRegraST.MakesqlRegraST(codigo: integer): string;
begin
  result := 'select P.cdregrast'+
                  ',g.cdregrast'+
                  ',g1.cdregrast'+
                  ',g2.cdregrast'+' '+
            'from produto P '+
            'LEFT JOIN GRUPO G ON G.CDGRUPO=p.cdgrupo and g.cdempresa=p.cdempresa '+
            'left join grupo g1 on g1.cdgrupo=g.cdgrupopai and g1.cdempresa=g.cdempresa '+
            'left join grupo g2 on g2.cdgrupo=g1.cdgrupopai and g2.cdempresa=g1.cdempresa '+
            'where p.cdempresa='+empresa.cdempresa.ToString+' and P.cdproduto='+inttostr(codigo);
end;

procedure TRegraST.AtribuirInformacaoDetalhe(cdsdetail: TDataset; i:integer);
begin
  cdsdetail.FieldByName(_cdcfop).AsInteger          := itregrast.items[i].cdcfop;

  cdsdetail.FieldByName(_nusticms).AsString        := itregrast.items[i].nusticms;
  cdsdetail.FieldByName(_nustipi).AsString         := itregrast.items[i].nustipi;
  cdsdetail.FieldByName(_nustcofins).AsString      := itregrast.items[i].nustcofins;
  cdsdetail.FieldByName(_nustpis).AsString         := itregrast.items[i].nustpis;

  cdsdetail.FieldByName(_alicms).AsFloat           := itregrast.items[i].alicms;
  cdsdetail.FieldByName(_alipi).AsFloat            := itregrast.items[i].alipi;
  cdsdetail.FieldByName(_alcofins).AsFloat         := itregrast.items[i].alcofins;
  cdsdetail.FieldByName(_alpis).AsFloat            := itregrast.items[i].alpis;
  if itregrast.items[i].alicmsred > 0 then
  begin
    cdsdetail.FieldByName(_alicmsred).AsFloat := itregrast.items[i].alicmsred;
  end;

  cdsdetail.FieldByName(_borecuperaicms).AsString   := itregrast.items[i].borecuperaicms;
  cdsdetail.FieldByName(_borecuperaipi).AsString    := itregrast.items[i].borecuperaipi;
  cdsdetail.FieldByName(_borecuperacofins).AsString := itregrast.items[i].borecuperacofins;
  cdsdetail.FieldByName(_borecuperapis).AsString    := itregrast.items[i].borecuperapis;
end;

function TRegraST.ObterCFOPII(cduf, cdcfopdentro, cdcfopfora: integer):integer;
begin
  if ObterCdUF(cduf) = empresa.endereco.cduf then
  begin
    result := cdcfopdentro;
  end
  else
  begin
    result := cdcfopfora;
  end;
end;

function TRegraST.AlgumCFOPPreenchido(registro : TRegraSTRecord):boolean;
begin
  result := (registro.cdcfopduf <> 0) or (registro.cdcfopfuf <> 0) or (registro.cdcfopdufsubtrib <> 0) or (registro.cdcfopfufsubtrib <> 0);
end;

function TRegraST.SomenteCFOPNormalPreenchido(registro : TRegraSTRecord):boolean;
begin
  result := (registro.cdcfopduf <> 0) and (registro.cdcfopdufsubtrib = 0) and (registro.cdcfopfuf <> 0) and (registro.cdcfopfufsubtrib = 0);
end;

function TRegraST.SomenteCFOPSubTribPreenchido(registro : TRegraSTRecord):boolean;
begin
  result := (registro.cdcfopduf = 0) and (registro.cdcfopdufsubtrib <> 0) and (registro.cdcfopfuf = 0) and (registro.cdcfopfufsubtrib <> 0);
end;

function TRegraST.STICMSdoProdutoEhSubTrib(cdproduto: integer):boolean;
var
  nusticms : string;
begin
  nusticms := qregistro.StringdoCodigo(_produto, cdproduto, _nusticms);
  result := (nusticms <> '') and BooleandoCodigo(_sticms, nusticms, _boicmssubtrib, _nu, True);
end;

function TRegraST.ObterCFOP(var nusticms : string; cdsdetail: TDataset; registro : TRegraSTRecord):integer;
begin
  result := 0;
  if not AlgumCFOPPreenchido(registro) then
  begin
    exit;
  end;
  if SomenteCFOPNormalPreenchido(registro) then
  begin
    result := ObterCFOPII(registro.cduf, registro.cdcfopduf, registro.cdcfopfuf);
  end
  else if SomenteCFOPSubTribPreenchido(registro) then
  begin
    result := ObterCFOPII(registro.cduf, registro.cdcfopdufsubtrib, registro.cdcfopfufsubtrib);
  end
  else
  begin
    if not STICMSdoProdutoEhSubTrib(cdsdetail.fieldbyname(_cdproduto).asinteger) then
    begin
      result := ObterCFOPII(registro.cduf, registro.cdcfopduf, registro.cdcfopfuf);
      exit;
    end;
    result := ObterCFOPII(registro.cduf, registro.cdcfopdufsubtrib, registro.cdcfopfufsubtrib);
       { TODO 5 -oPaulo -cVerificar : Não entendi para que servem as linhas abaixo }
    if result = 0 then
    begin
      if ObterCdUF(registro.cduf) = empresa.endereco.cduf then
      begin
        nusticms := qregistro.StringdoCodigo(_cfop, registro.cdcfopduf, _nusticms);
      end
      else
      begin
        nusticms := qregistro.StringdoCodigo(_cfop, registro.cdcfopfuf, _nusticms);
      end;
      if nusticms <> '' then
      begin
        result := ObterCFOPII(registro.cduf, registro.cdcfopduf, registro.cdcfopfuf);
      end;
    end;
  end;
end;

function TRegraST.GetRegraST(cdsdetail: TDataset; registro : TRegraSTRecord):boolean;
var
  cdcfop : integer;
  nusticms : string;
  passou : Boolean;
  i: Integer;
begin
  result := False;
  if cdsdetail.fieldbyname(_cdproduto).AsString = '' then
  begin
    Exit;
  end;
  cdregrast := ObterCdRegraST(cdsdetail.fieldbyname(_cdproduto).Asinteger);
  if cdregrast = 0 then
  begin
    Exit;
  end;
  passou := False;
  itregrast.Ler(cdregrast);
  cdcfop := ObterCFOP(nusticms, cdsdetail, registro);
  for i := 0 to itregrast.Count - 1 do
  begin
    if (registro.tpentsai = _s) and (not itregrast.Items[i].CFOPdeSaida) then
    begin
      Continue;
    end;
    if itregrast.Items[i].check_uf_dentro_ou_fora(ObterCdUF(registro.cduf)) then
    begin
      Continue;
    end;
    if (itregrast.items[i].tpregime <> '') and (itregrast.items[i].tpregime <> registro.tpregime) then
    begin
      Continue;
    end;
    if cdcfop <> 0 then
    begin
      if (itregrast.items[i].cdcfop = cdcfop) then
      begin
        AtribuirInformacaoDetalhe(cdsdetail, i);
        if qregistro.BooleandoCodigo(_cfop, cdcfop, _BOICMSSUBTRIB) and (itregrast.Items[i].itregrastmva.Ler(makesql(itregrast.items[i].cditregrast, inttostr(ObterCdUF(registro.cduf))))) then
        begin
          cdsdetail.FieldByName(_alicmssubtrib).AsFloat                := itregrast.Items[i].itregrastmva.Items[0].alicmssubtrib;
          cdsdetail.FieldByName(_PRMRGVLADICIONADOICMSSUBTRIB).AsFloat := itregrast.Items[i].itregrastmva.Items[0].almva;
        end;
        result := True;
        Break;
      end
    end
    else if itregrast.Items[i].itregrastmva.Ler(makesql(itregrast.items[i].cditregrast, inttostr(ObterCdUF(registro.cduf)))) then
    begin
      cdsdetail.FieldByName(_alicmssubtrib).AsFloat                := itregrast.Items[i].itregrastmva.Items[0].alicmssubtrib;
      cdsdetail.FieldByName(_PRMRGVLADICIONADOICMSSUBTRIB).AsFloat := itregrast.Items[i].itregrastmva.Items[0].almva;
      AtribuirInformacaoDetalhe(cdsdetail, i);
      result := True;
      Break;
    end
    else if (not passou) and (not itregrast.Items[i].itregrastmva.Ler(makesql(itregrast.items[i].cditregrast))) then
    begiN
      passou := True;
      AtribuirInformacaoDetalhe(cdsdetail, i);
    end;
    result := True;
  end;
end;

function TRegraST.GetRegraSTPedidoOrcamento(cdsdetail: TClientDataSet; cdufcliente: integer; tpregime:string):boolean;
var
  i: integer;
  passou : Boolean;
begin
  result := False;
  if cdsdetail.fieldbyname(_cdproduto).AsString = '' then
  begin
    Exit;
  end;
  cdregrast := ObterCdRegraST(cdsdetail.fieldbyname(_cdproduto).Asinteger);
  if cdregrast = 0 then
  begin
    Exit;
  end;
  passou := False;
  itregrast.ler(cdregrast);
  for i := 0 to itregrast.Count - 1 do
  begin
    if (not qregistro.BooleandoCodigo(_cfop, itregrast.Items[i].cdcfop, _bopedido)) or
       (not itregrast.Items[i].CFOPdeSaida) or
       (
       (
         (ObterCdUF(cdufcliente) = empresa.endereco.cduf) and ((Copy(inttostr(itregrast.items[i].cdcfop), 1, 1)= _6) or (Copy(inttostr(itregrast.items[i].cdcfop), 1, 1)= _2)) or
         (ObterCdUF(cdufcliente) <> empresa.endereco.cduf) and ((Copy(inttostr(itregrast.items[i].cdcfop), 1, 1)= _5) or (Copy(inttostr(itregrast.items[i].cdcfop), 1, 1)= _1))
       ) // checkUFDentroOUFora(i) or
       or
       ((itregrast.items[i].tpregime <> '') and (itregrast.items[i].tpregime <> tpregime)) //check_regime(i)
       ) then
    begin
      Continue;
    end;
    if itregrast.Items[i].itregrastmva.Ler(makesql(itregrast.items[i].cditregrast, inttostr(cdufcliente))) then
    begin
      cdsdetail.FieldByName(_alicmssubtrib).AsFloat := itregrast.Items[i].itregrastmva.Items[0].alicmssubtrib;
      cdsdetail.FieldByName(_almva).AsFloat         := itregrast.Items[i].itregrastmva.Items[0].almva;
      cdsdetail.FieldByName(_alicms).AsFloat        := itregrast.items[i].alicms;
      result := True;
      Break;
    end
    else if (not passou) and (not itregrast.Items[i].itregrastmva.Ler(makesql(itregrast.items[i].cditregrast))) then
    begin
      passou := True;
      cdsdetail.FieldByName(_alicms).AsFloat := itregrast.items[i].alicms;
    end;
    result := True;
  end;
end;

function TRegraST.EncontrouRegraST(cdcfop: integer; cdregrast:integer; st:string):string;
begin
  result := '';
  if cdregrast <> 0 then
  begin
    result := RetornaSQLString('select nust'+st+' from itregrast where cdempresa='+empresa.cdempresa.ToString+' and cdregrast='+inttostr(cdregrast)+' and cdcfop='+inttostr(cdcfop));
  end;
end;

function TRegraST.GetST(tbl: string; cdproduto, cdcfop: integer; st:string):string;
begin
  result := '';
  if (cdproduto = 0) or (cdcfop = 0) or (st = '') or ((st=_ipi) and (tbl = _entrada)) then
  begin
    exit;
  end;
  if st = _icms then // considera primeiro o produto
  begin
    result := qregistro.StringdoCodigo(_produto, cdproduto, _nust+st);
    if result <> '' then
    begin
      if tbl = _entrada then
      begin
        if result = _500 then
        begin
          result := _60
        end
        else if Length(Result) = 3 then
        begin
          result := _90;
        end;
      end
      else if (tbl = _saida) and (empresa.tpregime = _s) then
      begin
        if result = _60 then
        begin
          result := _500
        end;
      end;
      Exit;
    end;
  end;
  result := EncontrouRegraST(cdcfop, ObterCdRegraST(cdproduto), st);
end;

function TRegraST.ObterCdRegraST(codigo:integer):integer;
var
  q : TClasseQuery;
begin
  result := 0;
  if codigo = 0 then
  begin
    exit;
  end;
  q := TClasseQuery.Create(MakesqlRegraST(codigo));
  try
    result := q.q.Fields[0].asinteger;
    if result = 0 then
    begin
      result := q.q.Fields[1].asinteger;
    end;
    if result = 0 then
    begin
      result := q.q.Fields[2].asinteger;
    end;
    if result = 0 then
    begin
      result := q.q.Fields[3].asinteger;
    end;
  finally
    freeandnil(q);
  end;
end;

end.
