unit orm.NegociacaoSaida;

interface

uses contnrs, Data.DB, System.SysUtils, System.Classes,
  uConstantes,
  Rotina.Retornasql,
  ORM.duplicata,
  classe.query, Classe.DAO;

type
  TNegociacaoSaida = class(TRegistroQuipos)
  private
    fcdnegociacao: integer;
    fvlduplicata: currency;
    fnuduplicata: string;
    fvlcomissao: currency;
    fcdtpcobranca: integer;
    fcdrepresentante: integer;
    fprmoradiaria: double;
    fdtvencimento: TDate;
    fcdduplicata: integer;
    fcdnegociacaosaida: integer;
  public
    [keyfield, AObrigatorio]
    property cdnegociacaosaida : integer read fcdnegociacaosaida write fcdnegociacaosaida;
    [fk]
    property cdduplicata : integer read fcdduplicata write fcdduplicata;
    [fk, Aobrigatorio]
    property cdnegociacao : integer read fcdnegociacao write fcdnegociacao;
    [fk]
    property cdtpcobranca : integer read fcdtpcobranca write fcdtpcobranca;
    [fk]
    property cdrepresentante : integer read fcdrepresentante write fcdrepresentante;
    [AObrigatorio]
    property vlduplicata : currency read fvlduplicata write fvlduplicata;
    property nuduplicata : string read fnuduplicata write fnuduplicata;
    [AObrigatorio]
    property dtvencimento : TDate read fdtvencimento write fdtvencimento;
    [Aobrigatorio]
    property prmoradiaria : double read fprmoradiaria write fprmoradiaria;
    [Aobrigatorio]
    property vlcomissao : currency read fvlcomissao write fvlcomissao;
  end;
  TNegociacaoSaidaList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TNegociacaoSaida;
    procedure SetItem(Index: Integer; const Value: TNegociacaoSaida);
  public
    function New: TNegociacaoSaida;
    property Items[Index: Integer]: TNegociacaoSaida read GetItem write SetItem;
    function Ler(codigo:Integer; cdfield:string=_cdnegociacao):Boolean;overload;
    function Ler(Dataset: TDataset):boolean;overload;
    function Soma(nmcampo: string): currency;
    function update(boscript:boolean=false):string;
    function RecalcularBaixaDuplicata:string;
  end;

implementation

function TNegociacaoSaidaList.GetItem(Index: Integer): TNegociacaoSaida;
begin
  Result := TNegociacaoSaida(Inherited Items[Index]);
end;

function TNegociacaoSaidaList.Ler(Dataset: TDataset): boolean;
begin
  clear;
  result := false;
  dataset.first;
  while not Dataset.Eof do
  begin
    new.Select(Dataset);
    Dataset.Next;
    result := true;
  end;
end;

function TNegociacaoSaidaList.Ler(codigo: Integer; cdfield: string): Boolean;
var
  q : TClasseQuery;
begin
  q := TClasseQuery.create(QRetornaSQL.get_select_from(_negociacaoSaida, codigo, cdfield));
  try
    result := Ler(q.q);
  finally
    FreeAndNil(q);
  end;
end;

function TNegociacaoSaidaList.New: TNegociacaoSaida;
begin
  Result := TNegociacaoSaida.Create;
  Add(Result);
end;

function TNegociacaoSaidaList.RecalcularBaixaDuplicata: string;
var
  I: Integer;
  duplicata : tduplicata;
  texto : string;
begin
  result := '';
  for I := 0 to count - 1 do
  begin
    duplicata := tduplicata.create;
    try
      if not duplicata.Select(items[i].cdduplicata) then
      begin
        continue;
      end;
      duplicata.vlcomissao := items[i].vlcomissao;
      if result <> '' then
      begin
        result := result + #13;
      end;
      result := result + duplicata.update(true);
      texto := duplicata.RecalcularComissaoBaixa;
      if texto <> '' then
      begin
        result := result + #13 + texto;
      end;
    finally
      freeandnil(duplicata);
    end;
  end;
end;

procedure TNegociacaoSaidaList.SetItem(Index: Integer; const Value: TNegociacaoSaida);
begin
  Put(Index, Value);
end;

function TNegociacaoSaidaList.Soma(nmcampo: string): currency;
var
  I: Integer;
begin
  result := 0;
  for I := 0 to count - 1 do
  begin
    if nmcampo = _vlduplicata then
    begin
      result := result + items[i].vlduplicata;
    end;
  end;
end;

function TNegociacaoSaidaList.update(boscript:boolean=false): string;
var
  I: Integer;
begin
  result := '';
  for I := 0 to count - 1 do
  begin
    if result <> '' then
    begin
      result := result + #13;
    end;
    result := result + items[i].Update(boscript);
  end;
end;

end.
