unit orm.StRepresentante;

interface

uses
  Classe.DAO;

type
  TStRepresentante = class(TRegistroQuipos)
  private
    fbogerarpedido: string;
    fnucor: integer;
    fbogerarcliente: string;
    fcdstrepresentante: integer;
    fboexcluir: string;
    fbogerarinfo: string;
    fbonovo: string;
    fbogerarsaida: string;
    fboalterar: string;
    fnmstrepresentante: string;
  public
    [keyfield]
    property cdstrepresentante : integer read fcdstrepresentante write fcdstrepresentante;
    [AObrigatorio]
    property nmstrepresentante : string read fnmstrepresentante write fnmstrepresentante;
    [AObrigatorio]
    property nucor : integer read fnucor write fnucor;
    [AObrigatorio]
    property bonovo : string read fbonovo write fbonovo;
    [AObrigatorio]
    property boalterar : string read fboalterar write fboalterar;
    [AObrigatorio]
    property boexcluir : string read fboexcluir write fboexcluir;
    [AObrigatorio]
    property bogerarinfo : string read fbogerarinfo write fbogerarinfo;
    [AObrigatorio]
    property bogerarcliente : string read fbogerarcliente write fbogerarcliente;
    [AObrigatorio]
    property bogerarpedido : string read fbogerarpedido write fbogerarpedido;
    [AObrigatorio]
    property bogerarsaida : string read fbogerarsaida write fbogerarsaida;
  end;

implementation

end.
