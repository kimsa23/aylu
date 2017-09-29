unit orm.StFormulacao;

interface

uses Classe.DAO;

type
  TStFormulacao = class(TPersintentObject)
  private
    Fboexcluir: String;
    Fbogerarinfo: String;
    Fboalterar: String;
    Fbonovo: String;
    Fnucor: Integer;
    Fcdstformulacao: Integer;
    Fnmstformulacao: string;
  public
    [keyfield]
    property cdstformulacao : Integer read Fcdstformulacao write Fcdstformulacao;
    property nmstformulacao : string read Fnmstformulacao write Fnmstformulacao;
    property nucor : Integer read Fnucor write Fnucor;
    property bonovo : String read Fbonovo write Fbonovo;
    property boalterar : String read Fboalterar write Fboalterar;
    property boexcluir : String read Fboexcluir write Fboexcluir;
    property bogerarinfo : String read Fbogerarinfo write Fbogerarinfo;
  end;

implementation

end.
