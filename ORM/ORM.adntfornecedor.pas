unit ORM.adntfornecedor;

interface

uses
  System.Generics.Collections, Controls, SysUtils, classes, data.db,
  sqlexpr,
  uconstantes, rotina.strings, rotina.registro,
  classe.aplicacao, orm.empresa, classe.registrainformacao, classe.executasql,
  classe.gerar, rotina.retornasql, classe.query, classe.dao;

type
  TAdntFornecedor = class(TRegistroQuipos)
  private
    Fcdadntfornecedor: integer;
    Fdshistorico: string;
    Fdsobservacao: string;
    Fcdfornecedor: LargeInt;
    Fvladntfornecedor: currency;
    Fvlutilizado: currency;
    Fdtentrada: TDate;
    Fcdstadntfornecedor: integer;
    Fvlsaldo: currency;
    Fdtbaixa: TDate;
    Fcdmovbancario: integer;
    Fdtemissao: TDate;
  public
    [keyfield]
    property cdadntfornecedor : integer read Fcdadntfornecedor write Fcdadntfornecedor;
    [AObrigatorio]
    [fk]
    property cdfornecedor : LargeInt read Fcdfornecedor write Fcdfornecedor;
    [AObrigatorio]
    property cdstadntfornecedor : integer read Fcdstadntfornecedor write Fcdstadntfornecedor;
    [Fk]
    property cdmovbancario : integer read Fcdmovbancario write Fcdmovbancario;
    [AObrigatorio]
    property dtemissao : TDate read Fdtemissao write Fdtemissao;
    property dtbaixa : TDate read Fdtbaixa write Fdtbaixa;
    property dtentrada : TDate read Fdtentrada write Fdtentrada;
    [AObrigatorio]
    property vladntfornecedor : currency read Fvladntfornecedor write Fvladntfornecedor;
    property dshistorico : string read Fdshistorico write Fdshistorico;
    [AObrigatorio]
    property vlsaldo : currency read Fvlsaldo write Fvlsaldo;
    property vlutilizado : currency read Fvlutilizado write Fvlutilizado;
    property dsobservacao : string read Fdsobservacao write Fdsobservacao;
    class function FornecedorPossuiAdiantamento(codigo : string; var cdadiantamento, valor:TStrings):boolean;overload;
    class function FornecedorPossuiAdiantamento(codigo : string):boolean;overload;
  end;
  TAdntFornecedorList = class
  private
    Flista: tobjectlist<TAdntFornecedor>;
  public
    property lista : tobjectlist<TAdntFornecedor> read Flista write Flista;
    function Ler(codigo:Integer; cdfield:string):Boolean;overload;
    function Ler(DataSet: TDataset):boolean;overload;
    function Ler(sqlwhere:string):boolean;overload;
    function indice(value:Integer):Integer;
  end;

implementation

class function TAdntFornecedor.FornecedorPossuiAdiantamento(codigo : string; var cdadiantamento, valor:TStrings):boolean;
var
  q : TClasseQuery;
begin
  result := false;
  if (codigo = '') or (RetornaSQLInteger('select count(*) from adntfornecedor where cdempresa='+empresa.cdempresa.tostring+' and vlsaldo>0 and cdfornecedor='+codigo) = 0) then
  begin
    exit;
  end;
  q := TClasseQuery.create('select cdadntfornecedor,vlsaldo from adntfornecedor where cdempresa='+empresa.cdempresa.tostring+' and vlsaldo>0 and cdfornecedor='+codigo+' order by cdadntfornecedor');
  try
    while not q.q.eof do
    begin
      cdadiantamento.add(q.q.fields[0].asstring);
      valor.add         (formatfloat(__moeda, q.q.fields[1].ascurrency));
      q.q.next;
    end;
    result := true;
  finally
    freeandnil(q);
  end;
end;

class function TAdntFornecedor.FornecedorPossuiAdiantamento(codigo : string):boolean;
begin
  result := RetornaSQLInteger('select count(*) from adntfornecedor where cdempresa='+empresa.cdempresa.tostring+' and vlsaldo>0 and cdfornecedor='+codigo) > 0;
end;

function TAdntFornecedorList.indice(value: Integer): Integer;
var
  adntfornecedor : TAdntFornecedor;
  i : Integer;
begin
  i := -1;
  result := i;
  for adntfornecedor in lista do
  begin
    Inc(i);
    if value = adntfornecedor.cdadntfornecedor then
    begin
      result := i;
      Break;
    end;
  end;
end;

function TAdntFornecedorList.Ler(DataSet: TDataset): boolean;
begin
  lista.Clear;
  result := false;
  dataset.first;
  while not dataset.Eof do
  begin
    Lista.Add(TAdntFornecedor.Create);
    lista[lista.Count-1].Select(dataset);
    dataset.Next;
    result := true;
  end;
end;

function TAdntFornecedorList.Ler(codigo: Integer; cdfield: string): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_adntfornecedor, cdfield));
  try
    result := Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

function TAdntFornecedorList.Ler(sqlwhere: string): boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_where(_AdntFornecedor, sqlwhere));
  try
    result := Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

end.
