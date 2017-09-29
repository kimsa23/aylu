unit orm.SetBoleto;

interface

uses Contnrs, System.SysUtils, System.Classes,
  uConstantes,
  ORM.Empresa,
  Rotina.Retornasql,
  classe.query, classe.Executasql,classe.dao;

type
  TSetBoleto = class(TRegistroQuipos)
  private
    Fdsinstrucao2: string;
    Fcdtpcarteiraboleto: integer;
    Fcdsetboletorespemissao: integer;
    Fnuconvenio: string;
    //Fdsboleto: string;
    Fdsinstrucao1: string;
    //Fdsboletofr: string;
    Fnuboleta: integer;
    Fnudiasprotesto: integer;
    Fdsespecie: string;
    Fnmsetboleto: string;
    Fcdconta: integer;
    Fdsinstrucaoboleta: string;
    Fbodespesaretornoliquidado: string;
    Fcdcedente: string;
    Fnuremessa: integer;
    //Fdsboletofatura: string;
    Fcdsetboletocaractitulo: integer;
    Fdslocalpagamento: string;
    Fcdsetboleto: integer;
    Fboaceite: string;
    Fnucarteira: string;
    Fdspathremessa: string;
    Ftparquivocobranca: string;
    //Fdsboletocarne: string;
    Fdsmodalidade: string;
  public
    [keyfield]
    property cdsetboleto : integer read Fcdsetboleto write fcdsetboleto;
    [fk]
    property cdconta : integer read Fcdconta write fcdconta;
    [fk]
    property cdsetboletorespemissao : integer read Fcdsetboletorespemissao write fcdsetboletorespemissao;
    [fk]
    property cdsetboletocaractitulo : integer read Fcdsetboletocaractitulo write fcdsetboletocaractitulo;
    [fk]
    property cdtpcarteiraboleto : integer read Fcdtpcarteiraboleto write fcdtpcarteiraboleto;
    property nmsetboleto : string read Fnmsetboleto write fnmsetboleto;
    property nuboleta : integer read Fnuboleta write fnuboleta;
    property nucarteira : string read Fnucarteira write fnucarteira;
    property nuconvenio : string read Fnuconvenio write fnuconvenio;
    property nuremessa : integer read Fnuremessa write fnuremessa;
    property tparquivocobranca : string read Ftparquivocobranca write ftparquivocobranca;
    property dsinstrucaoboleta : string read Fdsinstrucaoboleta write fdsinstrucaoboleta;
    property dsinstrucao1 : string read Fdsinstrucao1 write fdsinstrucao1;
    property dsinstrucao2 : string read Fdsinstrucao2 write fdsinstrucao2;
    property dsespecie : string read Fdsespecie write fdsespecie;
    property boaceite : string read Fboaceite write fboaceite;
    property cdcedente : string read Fcdcedente write fcdcedente;
    property dsmodalidade : string read Fdsmodalidade write fdsmodalidade;
    property dslocalpagamento : string read Fdslocalpagamento write fdslocalpagamento;
    property dspathremessa : string read Fdspathremessa write fdspathremessa;
    //property dsboleto : string read Fdsboleto write fdsboleto;
    //property dsboletocarne : string read Fdsboletocarne write fdsboletocarne;
    //property dsboletofatura : string read Fdsboletofatura write fdsboletofatura;
    //property dsboletofr : string read Fdsboletofr write fdsboletofr;
    property bodespesaretornoliquidado : string read Fbodespesaretornoliquidado write fbodespesaretornoliquidado;
    property nudiasprotesto : integer read Fnudiasprotesto write fnudiasprotesto;
    function remessa_inc:integer;
    function nuboleta_inc:Integer;
  end;
  TSetBoletoList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TSetBoleto;
    procedure SetItem(Index: Integer; const Value: TSetBoleto);
  public
    function New: TSetBoleto;
    property Items[Index: Integer]: TSetBoleto read GetItem write SetItem;
    function Ler(codigo:Integer):Boolean;
  end;

implementation

function TSetBoleto.remessa_inc: integer;
begin
  ExecutaSQL('update setboleto set nuremessa=nuremessa+1 where cdempresa='+empresa.cdempresa.ToString+' and cdsetboleto='+inttostr(cdsetboleto));
  select(cdsetboleto);
  result := nuremessa;
end;

function TSetBoleto.nuboleta_inc: Integer;
begin
  ExecutaSQL('update setboleto set nuboleta=nuboleta+1 where cdempresa='+empresa.cdempresa.ToString+' and cdsetboleto='+inttostr(cdsetboleto));
  select(cdsetboleto);
  result := nuboleta;
end;

function TSetBoletoList.GetItem(Index: Integer): TSetBoleto;
begin
  Result := TSetBoleto(Inherited Items[Index]);
end;

function TSetBoletoList.Ler(codigo: Integer): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_SetBoleto, codigo, _cdconta));
  try
    clear;
    result := q.q.RecordCount > 0;
    if not result then
    begin
      Exit;
    end;
    while not q.q.Eof do
    begin
      new.select(q.q.fieldbyname(_cdSetBoleto).AsInteger);
      q.q.Next;
    end;
  finally
    FreeAndNil(q);
  end;
end;

function TSetBoletoList.New: TSetBoleto;
begin
  Result := TSetBoleto.Create;
  Add(Result);
end;

procedure TSetBoletoList.SetItem(Index: Integer; const Value: TSetBoleto);
begin
  Put(Index, Value);
end;

end.
