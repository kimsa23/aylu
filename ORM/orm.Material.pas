unit orm.Material;

interface

uses Classe.DAO;

type
  TMaterial = class(TRegistroQuipos)
  private
    fcdmaterial : Integer;
    fnmmaterial : string;
    fqtpesoespecifico : Double;
    fnumultiplicar : Double;
  public
    [keyfield]
    property cdmaterial : Integer read fcdmaterial write fcdmaterial;
    property nmmaterial : string read fnmmaterial write fnmmaterial;
    property qtpesoespecifico : Double read fqtpesoespecifico write fqtpesoespecifico;
    property numultiplicar : Double read fnumultiplicar write fnumultiplicar;
  end;

implementation

end.
