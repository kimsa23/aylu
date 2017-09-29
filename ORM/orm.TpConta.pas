unit orm.TpConta;

interface

uses classe.dao;

type
  TTpConta = class(TRegistroQuipos)
  private
    Fcdtpconta: integer;
    Fbobanco: String;
    Fnucntcontabil: string;
    Fnmtpconta: string;
  public
    [keyfield]
    property cdtpconta : integer read Fcdtpconta write fcdtpconta;
    property nmtpconta : string read Fnmtpconta write fnmtpconta;
    property nucntcontabil : string read Fnucntcontabil write fnucntcontabil;
    property bobanco : String read Fbobanco write fbobanco;
  end;

implementation

end.
