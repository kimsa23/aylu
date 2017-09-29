unit ORM.TpCorrecao;

interface

uses sysutils, Controls, Contnrs, Classes, Data.DB,
  uconstantes, rotina.Registro, rotina.strings,
  orm.ItContratoNegociacao, orm.ItTpCorrecao,
  rotina.retornasql, classe.query, orm.contrato, classe.executasql, orm.duplicata, classe.dao;

type
  TTpCorrecao = class(TRegistroQuipos)
  private
    Fcdtpcorrecao: Integer;
    Fnmtpcorrecao: string;
    Fittpcorrecao: TItTpCorrecaoList;
  public
    property ittpcorrecao : TItTpCorrecaoList read Fittpcorrecao write fittpcorrecao;
    [keyfield]
    property cdtpcorrecao : Integer read Fcdtpcorrecao write fcdtpcorrecao;
    property nmtpcorrecao : string read Fnmtpcorrecao write fnmtpcorrecao;
    constructor create;
    destructor destroy; override;
    function Reajustar:Boolean;
  end;

implementation

constructor TTpCorrecao.create;
begin
  inherited;
  fittpcorrecao := tittpcorrecaolist.create;
end;

destructor TTpCorrecao.destroy;
begin
  freeandnil(fittpcorrecao);
  inherited;
end;

function TTpCorrecao.Reajustar: Boolean;
begin
  result := ittpcorrecao.reajustar;
end;

end.
