unit orm.HAprovacaoAutpagto;

interface

uses Data.DB,
  Classe.DAO;

type
  THAprovacaoAutpagto = class(TPersintentObject)
  private
    fcdhaprovacaoautpagto: integer;
    fcdempresa: largeint;
    fcdautpagto: integer;
    fcdcomputador: integer;
    ftsaprovacao: TDateTime;
    fcdusuario: integer;
    fcdtipo: string;
    fcdtphaprovacaoautpagto: integer;
  public
    [keyfield]
    property cdempresa: largeint read fcdempresa write fcdempresa;
    [keyfield]
    property cdhaprovacaoautpagto: integer read fcdhaprovacaoautpagto write fcdhaprovacaoautpagto;
    [fk, AObrigatorio]
    property cdautpagto: integer read fcdautpagto write fcdautpagto;
    [fk, AObrigatorio]
    property cdusuario: integer read fcdusuario write fcdusuario;
    [fk, AObrigatorio]
    property cdcomputador: integer read fcdcomputador write fcdcomputador;
    [fk, AObrigatorio]
    property cdtphaprovacaoautpagto: integer read fcdtphaprovacaoautpagto write fcdtphaprovacaoautpagto;
    [AObrigatorio]
    property tsaprovacao: TDateTime read ftsaprovacao write ftsaprovacao;
    property cdtipo: string read fcdtipo write fcdtipo;
  end;

implementation

end.
