unit orm.hstorcamento;

interface

uses Data.DB,
  Classe.DAO;

type
  THStOrcamento = class(TPersintentObject)
  private
    fcdhstorcamento: Integer;
    fcdorcamento: Integer;
    fcdstorcamento: Integer;
    fcdusuario: Integer;
    fcdcomputador: Integer;
    fcdempresa: largeint;
    ftshistorico: TDateTime;
    fdsjustificativa: string;
  public
    [KeyField]
    property cdempresa: largeint read fcdempresa write fcdempresa;
    [KeyField]
    property cdhstorcamento: Integer read fcdhstorcamento write fcdhstorcamento;
    [FK, AObrigatorio]
    property cdorcamento: Integer read fcdorcamento write fcdorcamento;
    [FK, AObrigatorio]
    property cdstorcamento: Integer read fcdstorcamento write fcdstorcamento;
    [FK, AObrigatorio]
    property cdusuario: Integer read fcdusuario write fcdusuario;
    [FK, AObrigatorio]
    property cdcomputador: Integer read fcdcomputador write fcdcomputador;
    [AObrigatorio]
    property tshistorico: TDateTime read ftshistorico write ftshistorico;
    property dsjustificativa: string read fdsjustificativa write fdsjustificativa;
  end;

implementation

end.
