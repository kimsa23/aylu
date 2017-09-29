unit ACBR.NFSE;

interface

uses //classesaida,
  ACBrNFSe;

type
  TNFSE = class
    nfsea: TACBrNFse;
  private
    //saida : tsaida;
  public
    constructor create;
    destructor destroy; override;
  end;

implementation

{ TNFSE }

constructor TNFSE.create;
begin

end;

destructor TNFSE.destroy;
begin

  inherited;
end;

end.
