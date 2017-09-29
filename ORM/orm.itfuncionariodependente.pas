unit orm.itfuncionariodependente;

interface

uses Classe.DAO;

type
  TItFuncionarioDependente = class(TRegistroQuipos)
  private
    fcditfuncionariodependente: integer;
    fcdfuncionario: integer;
    fcdgrauparentesco: integer;
    fnmitfuncionariodependente: string;
    fdtnascimento: TDate;
  public
    property cditfuncionariodependente: integer read fcditfuncionariodependente write fcditfuncionariodependente;
    [FK]
    property cdfuncionario: integer read fcdfuncionario write fcdfuncionario;
    [FK]
    property cdgrauparentesco: integer read fcdgrauparentesco write fcdgrauparentesco;
    [AObrigatorio]
    property nmitfuncionariodependente: string read fnmitfuncionariodependente write fnmitfuncionariodependente;
    property dtnascimento: TDate read fdtnascimento write fdtnascimento;
  end;

implementation

end.
