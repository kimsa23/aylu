unit ORM.Pais;

interface

uses classe.dao;

type
  TPais = class(TPersintentObject)
  protected
    Fnmpais: string;
    Fcdpais: Integer;
  public
    [keyfield]
    property cdpais : Integer read Fcdpais write fcdpais;
    property nmpais : string read Fnmpais write fnmpais;
  end;

implementation

end.
