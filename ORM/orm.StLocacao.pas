unit orm.StLocacao;

interface

uses Classe.DAO;

type
  TStLocacao = class(TPersintentObject)
  private
    Fnucor: integer;
    Fboexcluir: string;
    Fnmstlocacao: string;
    Fbogerarinfo: string;
    Fbonovo: string;
    Fbogerarsaida: string;
    Fcdstlocacao: integer;
    Fboalterar: string;
  public
    [keyfield]
    property cdstlocacao : integer read Fcdstlocacao write fcdstlocacao;
    property nmstlocacao : string read Fnmstlocacao write fnmstlocacao;
    property bonovo : string read Fbonovo write fbonovo;
    property boalterar : string read Fboalterar write fboalterar;
    property boexcluir : string read Fboexcluir write fboexcluir;
    property bogerarinfo : string read Fbogerarinfo write fbogerarinfo;
    property nucor : integer read Fnucor write fnucor;
    property bogerarsaida : string read Fbogerarsaida write fbogerarsaida;
  end;

implementation

end.
