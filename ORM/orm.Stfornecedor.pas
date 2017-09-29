unit orm.Stfornecedor;

interface

uses Classe.DAO;

type
  TStfornecedor = class(TRegistroQuipos)
  private
    Fbonovo: String;
    Fboexcluir: String;
    Fboalterar: String;
    Fbogerarsaida: String;
    Fbogerarinfo: String;
    Fbogerarentrada: String;
    Fcdstfornecedor: integer;
    Fnucor: integer;
    Fnmstfornecedor: string;
  public
    [keyfield]
    property cdstfornecedor : integer read Fcdstfornecedor write Fcdstfornecedor;
    property nmstfornecedor : string read Fnmstfornecedor write Fnmstfornecedor;
    property nucor : integer read Fnucor write Fnucor;
    property bonovo : String read Fbonovo write Fbonovo;
    property boalterar : String read Fboalterar write Fboalterar;
    property boexcluir : String read Fboexcluir write Fboexcluir;
    property bogerarinfo : String read Fbogerarinfo write Fbogerarinfo;
    property bogerarsaida : String read Fbogerarsaida write Fbogerarsaida;
    property bogerarentrada : String read Fbogerarentrada write Fbogerarentrada;
  end;

implementation

end.
