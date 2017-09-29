unit orm.ItContFornecedor;

interface

uses Data.DB,
  Classe.DAO;

type
  TItContFornecedor = class(TRegistroQuipos)
  private
    Femail: string;
    Fnmsetor: string;
    Fnufax: string;
    Fnmitcontfornecedor: string;
    Fcdfornecedor: LargeInt;
    Fnmfuncao: string;
    Fcditcontfornecedor: integer;
    Fhomepage: string;
    Fnuramal: string;
    Fnufone2: string;
    Fnufone1: string;
    Fnmdepartamento: string;
  public
    [keyfield]
    property cditcontfornecedor : integer read Fcditcontfornecedor write Fcditcontfornecedor;
    property cdfornecedor : LargeInt read Fcdfornecedor write Fcdfornecedor;
    property nmitcontfornecedor : string read Fnmitcontfornecedor write Fnmitcontfornecedor;
    property email : string read Femail write Femail;
    property homepage : string read Fhomepage write Fhomepage;
    property nuramal : string read Fnuramal write Fnuramal;
    property nufone1 : string read Fnufone1 write Fnufone1;
    property nufone2 : string read Fnufone2 write Fnufone2;
    property nufax : string read Fnufax write Fnufax;
    property nmdepartamento : string read Fnmdepartamento write Fnmdepartamento;
    property nmsetor : string read Fnmsetor write Fnmsetor;
    property nmfuncao : string read Fnmfuncao write Fnmfuncao;
  end;

implementation

end.
