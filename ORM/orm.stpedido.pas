unit orm.stpedido;

interface

uses Classe.DAO;

type
  tstpedido = class(TRegistroQuipos)
  private
    Fboexcluir: string;
    Fbogerarsaida: string;
    Fbogerarinfo: string;
    Fbonovo: string;
    Fbogerarordproducao: string;
    Fbogerartransporte: string;
    Fboalterar: string;
    Fnucor: Integer;
    Fcdstpedido: Integer;
    Fnmstpedido: string;
    Fboestoquedisponivel: string;
  public
    [keyfield]
    property cdstpedido : Integer read Fcdstpedido write Fcdstpedido;
    property nmstpedido : string read Fnmstpedido write Fnmstpedido;
    property nucor : Integer read Fnucor write Fnucor;
    property bonovo : string read Fbonovo write Fbonovo;
    property boalterar : string read Fboalterar write Fboalterar;
    property boexcluir : string read Fboexcluir write Fboexcluir;
    property bogerarinfo : string read Fbogerarinfo write Fbogerarinfo;
    property bogerarsaida : string read Fbogerarsaida write Fbogerarsaida;
    property bogerartransporte : string read Fbogerartransporte write Fbogerartransporte;
    property bogerarordproducao : string read Fbogerarordproducao write Fbogerarordproducao;
    property boestoquedisponivel : string read Fboestoquedisponivel write Fboestoquedisponivel;
  end;

implementation

end.
