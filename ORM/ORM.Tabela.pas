unit ORM.Tabela;

interface

uses
  SysUtils,
  uconstantes,
  classe.dao;

Type
  TTabela = class(TPersintentObject)
  private
    Fcdtabela: integer;
    Fboreadonly: string;
    Fdssql2: string;
    Fnmtabela: string;
    Fdssql: string;
    Fnmexibe: string;
  public
    [keyfield]
    property cdtabela : integer read Fcdtabela write Fcdtabela;
    property nmtabela : string read Fnmtabela write Fnmtabela;
    property nmexibe : string read Fnmexibe write Fnmexibe;
    property dssql : string read Fdssql write Fdssql;
    property dssql2 : string read Fdssql2 write Fdssql2;
    property boreadonly : string read Fboreadonly write Fboreadonly;
  end;

implementation

end.
