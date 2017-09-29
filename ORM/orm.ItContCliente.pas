unit orm.ItContCliente;

interface

uses Contnrs, Data.DB, System.SysUtils,
  uConstantes,
  Rotina.Retornasql,
  Classe.DAO, classe.query;

type
  TItContCliente = class(TRegistroQuipos)
  private
    Fcdcliente: LargeInt;
    Fdtcontato: TDate;
    Femail: string;
    Fnmsetor: string;
    Fnufax: string;
    Fnmfuncao: string;
    Fcditcontcliente: integer;
    Fdtnascimento: TDate;
    Fhomepage: string;
    Fnuramal: string;
    Fnufone2: string;
    Fnufone1: string;
    Fnmdepartamento: string;
    Fnmitcontcliente: string;
  public
    [keyfield]
    property cditcontcliente : integer read Fcditcontcliente write Fcditcontcliente;
    [fk]
    property cdcliente : LargeInt read Fcdcliente write Fcdcliente;
    property nmitcontcliente : string read Fnmitcontcliente write Fnmitcontcliente;
    property email : string read Femail write Femail;
    property homepage : string read Fhomepage write Fhomepage;
    property nuramal : string read Fnuramal write Fnuramal;
    property nufone1 : string read Fnufone1 write Fnufone1;
    property nufone2 : string read Fnufone2 write Fnufone2;
    property nufax : string read Fnufax write Fnufax;
    property nmdepartamento : string read Fnmdepartamento write Fnmdepartamento;
    property nmsetor : string read Fnmsetor write Fnmsetor;
    property nmfuncao : string read Fnmfuncao write Fnmfuncao;
    property dtnascimento : TDate read Fdtnascimento write Fdtnascimento;
    property dtcontato : TDate read Fdtcontato write Fdtcontato;
  end;

implementation

end.
