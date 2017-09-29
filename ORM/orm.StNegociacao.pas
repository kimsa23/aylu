unit orm.StNegociacao;

interface

uses Classe.DAO;

type
  TStNegociacao = class(TPersintentObject)
  private
    fnucor: integer;
    fnmstnegociacao: string;
    fboexcluir: string;
    fbogerarinfo: string;
    fbonovo: string;
    fcdstnegociacao: integer;
    fboalterar: string;
  public
    [keyfield]
    property cdstnegociacao : integer read fcdstnegociacao write fcdstnegociacao;
    property nmstnegociacao : string read fnmstnegociacao write fnmstnegociacao;
    property bonovo : string read fbonovo write fbonovo;
    property boalterar : string read fboalterar write fboalterar;
    property boexcluir : string read fboexcluir write fboexcluir;
    property bogerarinfo : string read fbogerarinfo write fbogerarinfo;
    property nucor : integer read fnucor write fnucor;
  end;

implementation

end.
