unit ORM.Municipio;

interface

uses SysUtils, controls,
  classe.query, rotina.retornasql, orm.serie, classe.dao,
  rotina.Registro, uConstantes, rotina.strings;

type
  TMunicipio = class(TPersintentObject)
  private
    Fcdmunicipio: integer;
    Fnmmunicipio: string;
    Fcduf: integer;
  public
    [keyfield]
    property cdmunicipio : integer read Fcdmunicipio write Fcdmunicipio;
    [fk]
    property cduf : integer read Fcduf write Fcduf;
    property nmmunicipio : string read Fnmmunicipio write Fnmmunicipio;
    class function SiglaMunicipioParaCodigo(sigla, nome:string):Integer;
  end;

implementation

class function TMunicipio.SiglaMunicipioParaCodigo(sigla, nomE: string): Integer;
var
  cduf : Integer;
begin
  result := 0;
  if (sigla = '') or (nome = '') then
  begin
    Exit;
  end;
  cduf := qregistro.CodigodoString(_uf, sigla, _sguf);
  if cduf = 0 then
  begin
    Exit;
  end;
  result := RetornaSQLInteger('select cdmunicipio from municipio where cduf='+cduf.ToString+' and nmmunicipio='+nome.QuotedString);
end;

end.
