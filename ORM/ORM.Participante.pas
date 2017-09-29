unit ORM.Participante;

interface

uses Contnrs, rotina.strings, uconstantes, System.SysUtils, system.classes, dialogs, system.uitypes;

type
  TParticipante = class
  private
    fcod_part : string;
    fnome : string;
    fdsendereco: string;
    fcnpj: string;
    fcdmunicipio: integer;
    fcpf: string;
    fsguf: string;
    fnmbairro: string;
    fnucep: string;
    fie: string;
    fcdpais: integer;
    fsuframa: string;
    fdsnumero: string;
    fnucxpostal: string;
    fnmmunicipio: string;
    fdscomplemento: string;
    fcduf: integer;
    procedure setcnpj(const Value: string);
    procedure setcpf(const Value: string);
    procedure setie(const Value: string);
    function getcdpais: integer;
    function getcdmunicipio: integer;
  public
    property cod_part: string read fcod_part write fcod_part;
    property nome: string read fnome write fnome;
    property cnpj: string read fcnpj write setcnpj;
    property cpf: string read fcpf write setcpf;
    property ie: string read fie write setie;
    property suframa: string read fsuframa write fsuframa;
    property cdmunicipio: integer read getcdmunicipio write fcdmunicipio;
    property cduf: integer read fcduf write fcduf;
    property cdpais: integer read getcdpais write fcdpais;
    property dsendereco: string read fdsendereco write fdsendereco;
    property dsnumero: string read fdsnumero write fdsnumero;
    property dscomplemento: string read fdscomplemento write fdscomplemento;
    property nmbairro: string read fnmbairro write fnmbairro;
    property nmmunicipio: string read fnmmunicipio write fnmmunicipio;
    property nucep: string read fnucep write fnucep;
    property sguf: string read fsguf write fsguf;
    property nucxpostal: string read fnucxpostal write fnucxpostal;
  end;
  TParticipanteList = class(TObjectList)
  private
    function  GetItem(Index: Integer): TParticipante;
    procedure SetItem(Index: Integer; const Value: TParticipante);
  public
    function New: TParticipante;
    property Items[Index: Integer]: TParticipante read GetItem write SetItem;
    function ParticipanteExiste(codigo:string):boolean;overload;
    function ParticipanteExiste(nucnpj, nucpf: string): boolean;overload;
  end;

implementation

function TParticipanteList.GetItem(Index: Integer): TParticipante;
begin
  Result := TParticipante(Inherited Items[Index]);
end;

function TParticipanteList.New: TParticipante;
begin
  Result := TParticipante.Create;
  result.cdpais := 1058;
  Add(Result);
end;

function TParticipanteList.ParticipanteExiste(codigo: string): boolean;
var
  i : integer;
begin
  result := false;
  for i := 0 to count - 1 do
  begin
    if items[i].cod_part = codigo then
    begin
      result := true;
      break;
    end;
  end;
end;

function TParticipanteList.ParticipanteExiste(nucnpj, nucpf: string): boolean;
var
  i : integer;
begin
  result := false;
  for i := 0 to count - 1 do
  begin
    if nucnpj <> '' then
    begin
      if items[i].cnpj = removercaracteres(nucnpj) then
      begin
        result := true;
        break;
      end;
    end
    else if (nucpf <> '') and (items[i].cpf = removercaracteres(nucpf)) then
    begin
      result := true;
      break;
    end;
  end;
end;

procedure TParticipanteList.SetItem(Index: Integer; const Value: TParticipante);
begin
  Put(Index, Value);
end;

{ TParticipante }

function TParticipante.getcdmunicipio: integer;
begin
  Result := fcdmunicipio;
  if result = 0 then
  begin
    messagedlg('Município não preenchido no participante '+cod_part+' - '+nome+'.', mtinformation, [mbok], 0);
    abort;
  end;
end;

function TParticipante.getcdpais: integer;
begin
  Result := fcdpais;
  if result = 0 then
  begin
    result := 1058;
  end;
end;

procedure TParticipante.setcnpj(const Value: string);
begin
  fcnpj := removercaracteres(Value);
end;

procedure TParticipante.setcpf(const Value: string);
begin
  fcpf := removercaracteres(Value);
end;

procedure TParticipante.setie(const Value: string);
begin
  fie := removercaracteres(Value);
end;

end.
