unit orm.ctetpmedida;

interface

uses System.SysUtils,
  uConstantes,
  classe.dao, classe.gerar;

type
  Tctetpmedida = class(TRegistroQuipos)
  private
    fnmctetpmedida: string;
    fcdctetpmedida: integer;
  public
    [keyfield]
    property cdctetpmedida : integer read fcdctetpmedida write fcdctetpmedida;
    property nmctetpmedida : string read fnmctetpmedida write fnmctetpmedida;
    class function InserirRegistro(nome:string):integer;
  end;

implementation

class function Tctetpmedida.InserirRegistro(nome: string): integer;
var
  tipo : Tctetpmedida;
begin
  tipo := Tctetpmedida.create;
  try
    tipo.cdctetpmedida := qgerar.GerarCodigo(_ctetpmedida);
    tipo.nmctetpmedida := nome;
    tipo.insert;
    result := tipo.cdctetpmedida;
  finally
    freeandnil(tipo);
  end;
end;

end.
