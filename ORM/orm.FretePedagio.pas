unit orm.FretePedagio;

interface

uses Data.DB,
  classe.dao;

type
  TFretePedagio = class(TRegistroQuipos)
  private
    fcdfretepedagio: Integer;
    fcdremetente: Largeint;
    fvlpedagio: Currency;
    fcddestinatario: Largeint;
    fvlfrete: Currency;
  public
    [KeyField]
    property cdfretepedagio: Integer read fcdfretepedagio write fcdfretepedagio;
    [FK, AObrigatorio]
    property cdremetente: Largeint read fcdremetente write fcdremetente;
    [FK, AObrigatorio]
    property cddestinatario: Largeint read fcddestinatario write fcddestinatario;
    [AObrigatorio]
    property vlfrete: Currency read fvlfrete write fvlfrete;
    [AObrigatorio]
    property vlpedagio: Currency read fvlpedagio write fvlpedagio;
  end;

implementation

end.
