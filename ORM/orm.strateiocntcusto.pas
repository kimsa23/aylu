unit orm.strateiocntcusto;

interface

uses Classe.DAO;

type
  TStRateiocntcusto = class(TRegistroQuipos)
  private
    fnucor: integer;
    fnmstrateiocntcusto: string;
    fboexcluir: string;
    fcdstrateiocntcusto: integer;
    fbogerarinfo: string;
    fbonovo: string;
    fboalterar: string;
  public
    [KeyField]
    property cdstrateiocntcusto: integer read fcdstrateiocntcusto write fcdstrateiocntcusto;
    [AObrigatorio]
    property nmstrateiocntcusto: string read fnmstrateiocntcusto write fnmstrateiocntcusto;
    [AObrigatorio]
    property bonovo: string read fbonovo write fbonovo;
    [AObrigatorio]
    property boalterar: string read fboalterar write fboalterar;
    [AObrigatorio]
    property boexcluir: string read fboexcluir write fboexcluir;
    [AObrigatorio]
    property bogerarinfo: string read fbogerarinfo write fbogerarinfo;
    [AObrigatorio]
    property nucor: integer read fnucor write fnucor;
  end;

implementation

end.
