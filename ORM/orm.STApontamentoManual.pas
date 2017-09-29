unit orm.STApontamentoManual;

interface

uses Classe.DAO;

type
  TSTApontamentoManual = class(TPersintentObject)
  private
    fnmstapontamentomanual : string;
    Fbonovo: String;
    Fboexcluir: String;
    Fboalterar: String;
    Fbogerarinfo: String;
    Fnucor: integer;
    fcdstapontamentomanual: Integer;
  public
    [keyfield]
    property cdstapontamentomanual : Integer read fcdstapontamentomanual write fcdstapontamentomanual;
    property nmstapontamentomanual : string read fnmstapontamentomanual write fnmstapontamentomanual;
    property bonovo : String read Fbonovo write Fbonovo;
    property boalterar : String read Fboalterar write Fboalterar;
    property boexcluir : String read Fboexcluir write Fboexcluir;
    property bogerarinfo : String read Fbogerarinfo write Fbogerarinfo;
    property nucor : integer read Fnucor write Fnucor;
  end;

implementation

end.
