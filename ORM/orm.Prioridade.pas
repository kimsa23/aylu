unit orm.Prioridade;

interface

uses Classe.DAO;

type
  TPrioridade = class(TRegistroQuipos)
  private
    fnucor: integer;
    fnmprioridade: string;
    fnudias: integer;
    fpracrescimo: double;
    fcdprioridade: integer;
  public
    [keyfield]
    property cdprioridade : integer read fcdprioridade write fcdprioridade;
    [Aobrigatorio]
    property nmprioridade : string read fnmprioridade write fnmprioridade;
    [Aobrigatorio]
    property nudias : integer read fnudias write fnudias;
    [Aobrigatorio]
    property nucor : integer read fnucor write fnucor;
    property pracrescimo : double read fpracrescimo write fpracrescimo;
  end;

implementation

end.
