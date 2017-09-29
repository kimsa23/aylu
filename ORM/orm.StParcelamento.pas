unit orm.StParcelamento;

interface

uses Classe.DAO;

type
  TStParcelamento = class(TPersintentObject)
  private
    fcdstparcelamento: integer;
    fnucor: integer;
    fboexcluir: string;
    fbogerarinfo: string;
    fbonovo: string;
    fnmstparcelamento: string;
    fboalterar: string;
  public
    [keyfield]
    property cdstparcelamento: integer read fcdstparcelamento write fcdstparcelamento;
    [AObrigatorio]
    property nmstparcelamento: string read fnmstparcelamento write fnmstparcelamento;
    [AObrigatorio]
    property bonovo: string read fbonovo write fbonovo;
    [AObrigatorio]
    property boalterar: string read fboalterar write fboalterar;
    [Aobrigatorio]
    property boexcluir: string read fboexcluir write fboexcluir;
    [Aobrigatorio]
    property bogerarinfo: string read fbogerarinfo write fbogerarinfo;
    [Aobrigatorio]
    property nucor: integer read fnucor write fnucor;
  end;

implementation

end.
