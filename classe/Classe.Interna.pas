unit Classe.Interna;

interface

uses System.Generics.Collections, System.SysUtils,
  rotina.strings, uConstantes;

type
  TMascaraNivel = class
  private
    fnunivel: String;
    fnufaixa: integer;
  public
    property nunivel : String read fnunivel write fnunivel;
    property nufaixa: integer read fnufaixa write fnufaixa;
  end;
  TListaMascaraNIvel = class
  private
    FLista: TObjectList<TMascaraNivel>;
    procedure AdicionarNivel(sItem:string);
  public
    property    Lista: TObjectList<TMascaraNivel> read FLista write FLista;
    procedure   CarregarLista(sMascara: String);
    function    FormatarNunivel(nunivel:string; nuitem: integer):string;
    constructor Create;
    destructor  Destroy; override;
    class function IndicedoNivel(sMascara: String):integer;
    class function ObterItemdoNivel(nunivel:string): integer;
  end;
     
implementation

procedure TListaMascaraNIvel.AdicionarNivel(sItem: string);
begin
  FLista.Add(TMascaraNivel.Create);
  FLista[FLista.Count -1].nunivel := sitem;
  FLista[FLista.Count -1].nufaixa := substituir(sItem, _0, _9).ToInteger;
end;

procedure TListaMascaraNIvel.CarregarLista(sMascara: String);
var
  I: Integer;
  sItem : string;
begin
  sItem := '';
  for I := 1 to sMascara.Length do
  begin
    if sMascara[i] = '.' then
    begin
      AdicionarNivel(sItem);
      sItem := '';
    end
    else
    begin
      sItem := sItem + sMascara[i];
    end;
  end;
  if sitem <> '' then
  begin
    AdicionarNivel(sItem);
  end;
end;

class function TListaMascaraNIvel.IndicedoNivel(sMascara: String): integer;
var
  I: Integer;
begin
  result := 0;
  for I := 1 to sMascara.Length do
  begin
    if sMascara[i] = '.' then
    begin
      inc(result);
    end;
  end;
end;

class function TListaMascaraNIvel.ObterItemdoNivel(nunivel: string): integer;
var
  lista : TListaMascaraNIvel;
begin
  lista := TListaMascaraNIvel.create;
  try
    lista.CarregarLista(nunivel);
    result := lista.Lista[TListaMascaraNIvel.IndicedoNivel(nunivel)].nunivel.ToInteger;
  finally
    freeandnil(lista);
  end;
end;

constructor TListaMascaraNIvel.Create;
begin
  inherited;
  FLista := TObjectList<TMascaraNivel>.Create;
end;

destructor TListaMascaraNIvel.Destroy;
begin
  FreeAndNil(FLista);
  inherited;
end;

function TListaMascaraNIvel.FormatarNunivel(nunivel: string; nuitem: integer): string;
begin
  if nunivel = '' then
  begin
    result := FormatarTextoEsquerda(nuitem.tostring, lista[0].nunivel.Length, _0);
  end
  else
  begin
    result := nunivel + '.' + FormatarTextoEsquerda(nuitem.tostring, lista[TListaMascaraNIvel.IndicedoNivel(nunivel)+1].nunivel.Length, _0);
  end;
end;

end.
