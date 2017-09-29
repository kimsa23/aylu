unit ORM.Itsaidafretesub;

interface

uses Classe.DAO;

type
  TItsaidafretesub = class(TRegistroQuipos)
  protected
    Fvlbasefretesub: Currency;
    Fvlfretesub: Currency;
    Fvlicms: Currency;
    Fvlcredito: Currency;
    Falfretesub: Double;
    Fcdsaida: Integer;
  public
    [keyfield]
    property cdsaida : Integer read Fcdsaida write fcdsaida;
    property alfretesub : Double read Falfretesub write falfretesub;
    property vlfretesub : Currency read Fvlfretesub write fvlfretesub;
    property vlcredito : Currency read Fvlcredito write fvlcredito;
    property vlicms : Currency read Fvlicms write fvlicms;
    property vlbasefretesub : Currency read Fvlbasefretesub write fvlbasefretesub;
  end;

implementation

end.
