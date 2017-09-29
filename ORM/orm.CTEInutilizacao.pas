unit orm.CTEInutilizacao;

interface

uses classe.dao;

type
  TCTEInutilizacao = class(TRegistroQuipos)
  private
    Fcdcteinutilizacao: integer;
    Fdsxml: string;
    Fcdctefinal: integer;
    Fcdcteinicial: integer;
    Fnuprotocolo: string;
    Fdsjustificativa: string;
    Fdtemissao: TDate;
  public
    [keyfield]
    property cdcteinutilizacao : integer read Fcdcteinutilizacao write Fcdcteinutilizacao;
    property cdcteinicial : integer read Fcdcteinicial write Fcdcteinicial;
    property cdctefinal : integer read Fcdctefinal write Fcdctefinal;
    property dtemissao : TDate read Fdtemissao write Fdtemissao;
    property dsjustificativa : string read Fdsjustificativa write Fdsjustificativa;
    property dsxml : string read Fdsxml write Fdsxml;
    property nuprotocolo : string read Fnuprotocolo write Fnuprotocolo;
  end;

implementation

end.
