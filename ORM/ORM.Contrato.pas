unit ORM.Contrato;

interface

uses
  sysutils, Controls, Contnrs, Forms, classes, data.db,
  uconstantes,
  orm.ItContratoParcela, orm.ItContratoPaciente, orm.tpcontrato, orm.ItContratoNegociacao,
  orm.produto, orm.duplicata, orm.empresa, orm.ItContrato,
  classe.dao, classe.gerar, classe.executasql, classe.query,
  rotina.strings, rotina.retornasql, rotina.Registro,
  dialogo.progressbar;

Type
  TContrato = class(TRegistroQuipos)
  private
    Fbomensalidade: String;
    Fvlcontrato: Currency;
    Fvlparcela: Currency;
    Fprcomissao: Double;
    Fcdperiodicidade: Integer;
    Fcdprodutoexcedente: Integer;
    Fcdcontrato: Integer;
    Fcdcondpagto: Integer;
    Fcdtpcontrato: Integer;
    Fcdproduto: Integer;
    Fcdstcontrato: Integer;
    Fcdrepresentante: Integer;
    Fnudiapreventiva: Integer;
    Fnuparcelas: integer;
    Fnmcontrato: string;
    Fcdcliente: LargeInt;
    Fdtfinal: TDate;
    Fdtpagamento: TDate;
    Fdtrefinanciamento: TDate;
    Fdtemissao: TDate;
    Fdtinicio: TDate;
    Fhratendimento: TTime;
    Fhrresolucao: TTime;
    Ftpcontrato: TTPContrato;
    FItContrato: TItContratoList;
    FItContratoPaciente: TItContratoPacienteList;
    FItContratoNegociacao: TItContratoNegociacaoList;
  public
    property tpcontrato : TTPContrato read Ftpcontrato write ftpcontrato;
    property ItContrato : TItContratoList read FItContrato write FItContrato;
    property ItContratoPaciente : TItContratoPacienteList read FItContratoPaciente write FItContratoPaciente;
    property ItContratoNegociacao : TItContratoNegociacaoList read FItContratoNegociacao write FItContratoNegociacao;
    [keyfield]
    property cdcontrato : Integer read Fcdcontrato write fcdcontrato;
    [fk]
    property cdstcontrato : Integer read Fcdstcontrato write fcdstcontrato;
    [fk]
    property cdtpcontrato : Integer read Fcdtpcontrato write fcdtpcontrato;
    [fk]
    property cdcliente : LargeInt read Fcdcliente write fcdcliente;
    [fk]
    property cdrepresentante : Integer read Fcdrepresentante write fcdrepresentante;
    [fk]
    property cdperiodicidade : Integer read Fcdperiodicidade write fcdperiodicidade;
    [fk]
    property cdproduto : Integer read Fcdproduto write fcdproduto;
    [fk]
    property cdprodutoexcedente : Integer read Fcdprodutoexcedente write fcdprodutoexcedente;
    [fk]
    property cdcondpagto : Integer read Fcdcondpagto write fcdcondpagto;
    property nmcontrato : string read Fnmcontrato write fnmcontrato;
    property dtinicio : TDate read Fdtinicio write fdtinicio;
    property dtfinal : TDate read Fdtfinal write fdtfinal;
    property nudiapreventiva : Integer read Fnudiapreventiva write fnudiapreventiva;
    property hratendimento : TTime read Fhratendimento write fhratendimento;
    property hrresolucao : TTime read Fhrresolucao write fhrresolucao;
    property vlcontrato : Currency read Fvlcontrato write fvlcontrato;
    property nuparcelas : integer read Fnuparcelas write fnuparcelas;
    property vlparcela : Currency read Fvlparcela write fvlparcela;
    property prcomissao : Double read Fprcomissao write fprcomissao;
    property dtemissao : TDate read Fdtemissao write fdtemissao;
    property dtrefinanciamento : TDate read Fdtrefinanciamento write fdtrefinanciamento;
    property dtpagamento : TDate read Fdtpagamento write fdtpagamento;
    property bomensalidade : String read Fbomensalidade write fbomensalidade;
    constructor create;
    destructor destroy; override;
  end;
  TContratoList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TContrato;
    procedure SetItem(Index: Integer; const Value: TContrato);
  public
    function New: TContrato;
    property Items[Index: Integer]: TContrato read GetItem write SetItem;
    function Ler(codigo:Integer; cdfield:string):Boolean;overload;
    function Ler(DataSet: TDataset):boolean;overload;
    function Existe(cdcontrato:integer):boolean;
    function Indice(codigo:integer):integer;
  end;

implementation

constructor TContrato.create;
begin
  inherited create;
  fitcontrato := titcontratoList.create;
  ftpcontrato := ttpcontrato.create;
  fItContratoNegociacao := tItContratoNegociacaoList.create;
  fItContratoPaciente := tItContratoPacienteList.create;
end;

destructor TContrato.destroy;
begin
  FreeAndNil(ftpcontrato);
  FreeAndNil(fitcontrato);
  FreeAndNil(fItContratoNegociacao);
  FreeAndNil(fItContratoPaciente);
  inherited;
end;

function TContratoList.Existe(cdcontrato: integer): boolean;
var
  I: Integer;
begin
  result := false;
  for I := 0 to count - 1 do
  begin
    if items[i].cdcontrato = cdcontrato then
    begin
      result := true;
      break;
    end;
  end;
end;

function TContratoList.GetItem(Index: Integer): TContrato;
begin
  Result := TContrato(Inherited Items[Index]);
end;

function TContratoList.Indice(codigo: integer): integer;
var
  I: Integer;
begin
  result := -1;
  for I := 0 to count - 1 do
  begin
    if items[i].cdcontrato = codigo then
    begin
      result := i;
      break;
    end;
  end;
end;

function TContratoList.Ler(DataSet: TDataset): boolean;
begin
  clear;
  result := false;
  dataset.first;
  while not dataset.Eof do
  begin
    new.Select(dataset);
    dataset.Next;
    result := true;
  end;
end;

function TContratoList.Ler(codigo: Integer; cdfield: string): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_Contrato, codigo, cdfield));
  try
    result := Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

function TContratoList.New: TContrato;
begin
  Result := TContrato.Create;
  Add(Result);
end;

procedure TContratoList.SetItem(Index: Integer; const Value: TContrato);
begin
  Put(Index, Value);
end;

end.
