unit orm.StCliente;

interface

uses Classe.DAO;

type
  TStCliente = class(TRegistroQuipos)
  private
    Fbonovo: string;
    Fboexcluir: string;
    Fboalterar: string;
    Fbogerarsaida: string;
    Fbogerarinfo: string;
    Fbogerarpedido: string;
    Fbogerarcomissao: string;
    Fbogerarmensalidade: string;
    Fbogerarentrada: string;
    Fcdstcliente: integer;
    Fnucor: integer;
    Fnmstcliente: string;
  public
    [keyfield]
    property cdstcliente : integer read Fcdstcliente write Fcdstcliente;
    property nmstcliente : string read Fnmstcliente write Fnmstcliente;
    property bonovo : string read Fbonovo write Fbonovo;
    property boalterar : string read Fboalterar write Fboalterar;
    property boexcluir : string read Fboexcluir write Fboexcluir;
    property bogerarinfo : string read Fbogerarinfo write Fbogerarinfo;
    property bogerarpedido : string read Fbogerarpedido write Fbogerarpedido;
    property bogerarsaida : string read Fbogerarsaida write Fbogerarsaida;
    property bogerarentrada : string read Fbogerarentrada write Fbogerarentrada;
    property bogerarcomissao : string read Fbogerarcomissao write Fbogerarcomissao;
    property nucor : integer read Fnucor write Fnucor;
    property bogerarmensalidade : string read Fbogerarmensalidade write Fbogerarmensalidade;
  end;

implementation

end.
