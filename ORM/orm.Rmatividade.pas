unit orm.Rmatividade;

interface

uses classe.dao;

type
  TRmatividade = class(TRegistroQuipos)
  private
    fcdrmatividade: Integer;
    fnmrmatividade: string;
  public
    [KeyField]
    property cdrmatividade: Integer read fcdrmatividade write fcdrmatividade;
    [AObrigatorio]
    property nmrmatividade: string read fnmrmatividade write fnmrmatividade;
  end;

implementation

end.
