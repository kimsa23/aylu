unit orm.StFaturamento;

interface

uses Classe.DAO;

type
  TStFaturamento = class(TPersintentObject)
  private
    Fcdstfaturamento: integer;
    fbogerarpedido: string;
    fnucor: integer;
    fnmstfaturamento: string;
    fboexcluir: string;
    fbogerarinfo: string;
    fbonovo: string;
    fbogerarsaida: string;
    fbogerarcdbarra: string;
    fboalterar: string;
  public
    [keyfield]
    property cdstfaturamento : integer read Fcdstfaturamento write Fcdstfaturamento;
    [AObrigatorio]
    property nmstfaturamento : string read fnmstfaturamento write fnmstfaturamento;
    property nucor : integer read fnucor write fnucor;
    property bonovo : string read fbonovo write fbonovo;
    property boalterar : string read fboalterar write fboalterar;
    property boexcluir : string read fboexcluir write fboexcluir;
    property bogerarinfo : string read fbogerarinfo write fbogerarinfo;
    property bogerarpedido : string read fbogerarpedido write fbogerarpedido;
    property bogerarsaida : string read fbogerarsaida write fbogerarsaida;
    property bogerarcdbarra : string read fbogerarcdbarra write fbogerarcdbarra;
  end;

implementation

end.
