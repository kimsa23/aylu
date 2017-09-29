unit orm.StOrdCompra;

interface

uses Classe.DAO;

type
  TStOrdCompra = class(TPersintentObject)
  private
    Fbonovo: String;
    Fboexcluir: String;
    Fboalterar: String;
    Fbogerarinfo: String;
    Fboentregue: String;
    Fnucor: integer;
    Fnmstordcompra: string;
    Fcdstordcompra : Integer;
  public
    [keyfield]
    property cdstordcompra : integer read Fcdstordcompra write Fcdstordcompra;
    property nmstordcompra : string read Fnmstordcompra write Fnmstordcompra;
    property bonovo : String read Fbonovo write Fbonovo;
    property boalterar : String read Fboalterar write Fboalterar;
    property boexcluir : String read Fboexcluir write Fboexcluir;
    property bogerarinfo : String read Fbogerarinfo write Fbogerarinfo;
    property boentregue : String read Fboentregue write Fboentregue;
    property nucor : integer read Fnucor write Fnucor;
  end;

implementation

end.
