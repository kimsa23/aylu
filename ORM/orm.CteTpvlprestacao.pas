unit orm.CteTpvlprestacao;

interface

uses System.SysUtils,
  uConstantes,
  classe.dao, classe.gerar;

type
  TCteTpvlprestacao = class(TRegistroQuipos)
  private
    fnmctetpvlprestacao: string;
    fbotributa: string;
    fcdctetpvlprestacao: integer;
  public
    [keyfield]
    property cdctetpvlprestacao : integer read fcdctetpvlprestacao write fcdctetpvlprestacao;
    property nmctetpvlprestacao : string read fnmctetpvlprestacao write fnmctetpvlprestacao;
    property botributa : string read fbotributa write fbotributa;
    class function InserirRegistro(nome:string):integer;
  end;

implementation

class function TCTETPVLPRESTACAO.InserirRegistro(nome: string): integer;
var
  tipo : TCTETPVLPRESTACAO;
begin
  tipo := TCTETPVLPRESTACAO.create;
  try
    tipo.cdctetpvlprestacao := qgerar.GerarCodigo(_CTETPVLPRESTACAO);
    tipo.nmctetpvlprestacao := nome;
    tipo.botributa := _n;
    tipo.insert;
    result := tipo.cdctetpvlprestacao;
  finally
    freeandnil(tipo);
  end;
end;

end.
