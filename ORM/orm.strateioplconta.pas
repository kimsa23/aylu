unit orm.strateioplconta;

interface

uses Classe.DAO;

type
  TStRateioPlConta = class(TRegistroQuipos)
  private
    fnucor: integer;
    fnmstrateioplconta: string;
    fboexcluir: string;
    fcdstrateioplconta: integer;
    fbogerarinfo: string;
    fbonovo: string;
    fboalterar: string;
  public
    [KeyField]
    property cdstrateioplconta: integer read fcdstrateioplconta write fcdstrateioplconta;
    [AObrigatorio]
    property nmstrateioplconta: string read fnmstrateioplconta write fnmstrateioplconta;
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
