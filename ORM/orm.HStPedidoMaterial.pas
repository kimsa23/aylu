unit orm.HStPedidoMaterial;

interface

uses Data.DB,
  Classe.DAO;

type
  THStPedidoMaterial = class(TPersintentObject)
  private
    Fcdempresa: Largeint;
    Fcdcomputador: integer;
    Fcdusuario: integer;
    Fcdstpedidomaterial: integer;
    Fcdhstpedidomaterial: integer;
    Ftshistorico: TDateTime;
    Fdsjustificativa: string;
    Fcdpedidomaterial: integer;
  public
    [keyfield]
    property cdempresa : Largeint read Fcdempresa write Fcdempresa;
    [keyfield]
    property cdhstpedidomaterial : integer read Fcdhstpedidomaterial write Fcdhstpedidomaterial;
    [fk]
    property cdpedidomaterial : integer read Fcdpedidomaterial write Fcdpedidomaterial;
    [fk]
    property cdstpedidomaterial : integer read Fcdstpedidomaterial write Fcdstpedidomaterial;
    [fk]
    property cdusuario : integer read Fcdusuario write Fcdusuario;
    [fk]
    property cdcomputador : integer read Fcdcomputador write Fcdcomputador;
    property tshistorico : TDateTime read Ftshistorico write Ftshistorico;
    property dsjustificativa : string read Fdsjustificativa write Fdsjustificativa;
  end;

implementation

end.
