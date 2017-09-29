unit ORM.Formulacao;

interface

uses SysUtils, Classes, Controls, DB, Contnrs,
  classe.query, rotina.retornasql, classe.dao,
  orm.RegiaoAplicacao,orm.ItFormulacao, orm.StFormulacao,
  rotina.Registro, uconstantes;

Type
  TFormulacao = class(TRegistroQuipos)
  private
    Fqtmistura: Double;
    Fqtpeso: Double;
    Fcdformulacao: Integer;
    Fcdregiaoaplicacao: Integer;
    Fcdstformulacao: Integer;
    Fnurevisao: string;
    Fnmformulacao: string;
    Fcdcliente: LargeInt;
    Fdsformulacao: string;
    Fdtrevisao: TDate;
    Fstformulacao: TStFormulacao;
    Fitformulacao: TItformulacaoList;
    Fregiaoaplicacao: TRegiaoAplicacao;
    procedure Setregiaoaplicacao(const Value: TRegiaoAplicacao);
  public
    property itformulacao : TItformulacaoList read Fitformulacao write Fitformulacao;
    property stformulacao : TStFormulacao read Fstformulacao write Fstformulacao;
    property regiaoaplicacao : TRegiaoAplicacao read Fregiaoaplicacao write Setregiaoaplicacao;
    [keyfield]
    property cdformulacao : Integer read Fcdformulacao write Fcdformulacao;
    [fk]
    property cdregiaoaplicacao : Integer read Fcdregiaoaplicacao write Fcdregiaoaplicacao;
    [fk]
    property cdcliente : LargeInt read Fcdcliente write Fcdcliente;
    [fk]
    property cdstformulacao : Integer read Fcdstformulacao write Fcdstformulacao;
    property nmformulacao : string read Fnmformulacao write Fnmformulacao;
    property dsformulacao : string read Fdsformulacao write Fdsformulacao;
    property qtpeso : Double read Fqtpeso write Fqtpeso;
    property qtmistura : Double read Fqtmistura write Fqtmistura;
    property dtrevisao : TDate read Fdtrevisao write Fdtrevisao;
    property nurevisao : string read Fnurevisao write Fnurevisao;
    constructor create;
    destructor destroy; override;
  end;
  TformulacaoList = class(TObjectList)
  private
    function  GetItem(Index: Integer): Tformulacao;
    procedure SetItem(Index: Integer; const Value: Tformulacao);
  public
    function New: Tformulacao;
    property Items[Index: Integer]: Tformulacao read GetItem write SetItem;
  end;

implementation

constructor TFormulacao.create;
begin
  inherited;
  fregiaoaplicacao := TRegiaoAplicacao.create;
  Fitformulacao := TItformulacaoList.Create;
  Fstformulacao := TStFormulacao.create;
end;

destructor TFormulacao.destroy;
begin
  FreeAndNil(fregiaoaplicacao);
  FreeAndNil(fstformulacao);
  FreeAndNil(fitformulacao);
  inherited;
end;

procedure TFormulacao.Setregiaoaplicacao(const Value: TRegiaoAplicacao);
begin
  Fregiaoaplicacao := Value;
end;

function TformulacaoList.GetItem(Index: Integer): Tformulacao;
begin
  Result := Tformulacao(Inherited Items[Index]);
end;

function TformulacaoList.New: Tformulacao;
begin
  Result := Tformulacao.Create;
  Add(Result);
end;

procedure TformulacaoList.SetItem(Index: Integer; const Value: Tformulacao);
begin
  Put(Index, Value);
end;

end.
