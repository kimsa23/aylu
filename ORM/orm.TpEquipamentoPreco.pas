unit orm.TpEquipamentoPreco;

interface

uses Classe.DAO;

type
  TTpEquipamentoPreco = class(TRegistroQuipos)
  private
    Fcdperiodicidade: integer;
    Fvlpreco: currency;
    Fcdtpequipamento: integer;
    Fnudias: integer;
  public
    [keyfield]
    property cdtpequipamento : integer read Fcdtpequipamento write fcdtpequipamento;
    [keyfield]
    property nudias : integer read Fnudias write fnudias;
    property vlpreco : currency read Fvlpreco write fvlpreco;
    [fk]
    property cdperiodicidade : integer read Fcdperiodicidade write fcdperiodicidade;
  end;

implementation

end.
