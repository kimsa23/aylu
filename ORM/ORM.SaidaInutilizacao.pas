unit ORM.SaidaInutilizacao;

interface

uses classe.dao;

type
  TSaidaInutilizacao = class(TRegistroQuipos)
  private
    fdsxml: string;
    fcdsaidainutilizacao: integer;
    fnuprotocolo: string;
    fcdsaidafinal: integer;
    fcdsaidainicial: integer;
    fnusaidafinal: integer;
    fdsjustificativa: string;
    fnusaidainicial: integer;
    fdtemissao: TDate;
  public
    [keyfield]
    property cdsaidainutilizacao : integer read fcdsaidainutilizacao write fcdsaidainutilizacao;
    [fk]
    property cdsaidainicial : integer read fcdsaidainicial write fcdsaidainicial;
    [fk]
    property cdsaidafinal : integer read fcdsaidafinal write fcdsaidafinal;
    [aobrigatorio]
    property nusaidainicial : integer read fnusaidainicial write fnusaidainicial;
    [aobrigatorio]
    property nusaidafinal : integer read fnusaidafinal write fnusaidafinal;
    [aobrigatorio]
    property dtemissao : TDate read fdtemissao write fdtemissao;
    [aobrigatorio]
    property dsjustificativa : string read fdsjustificativa write fdsjustificativa;
    [aobrigatorio]
    property dsxml : string read fdsxml write fdsxml;
    [aobrigatorio]
    property nuprotocolo : string read fnuprotocolo write fnuprotocolo;
  end;

implementation

end.
