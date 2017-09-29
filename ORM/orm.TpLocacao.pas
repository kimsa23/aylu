unit orm.TpLocacao;

interface

uses Classe.DAO;

type
  TTpLocacao = class(TRegistroQuipos)
  private
    Fborecebido: string;
    Fborenovarcontrato: string;
    Fboassociarfuncionariotroca: string;
    Fbocoresponsavel: string;
    Fbonmacessorio: string;
    Fboequipamentosaldo: string;
    Fboentregaparcial: string;
    Fdslayoutequipamento: string;
    Fbovlacrescimo: string;
    Fbodtprevista: string;
    Fnmtplocacao: string;
    Fbousuarioentregue: string;
    Fbovlcaucao: string;
    Fcdproduto: integer;
    Fboentregue: string;
    Fcdtpcliente: integer;
    Fnudiainicial: integer;
    Fbovlacessorio: string;
    Fcdtplocacao: integer;
    fbooperador: string;
  public
    [keyfield]
    property cdtplocacao : integer read Fcdtplocacao write fcdtplocacao;
    [fk]
    property cdproduto : integer read Fcdproduto write fcdproduto;
    [fk]
    property cdtpcliente : integer read Fcdtpcliente write fcdtpcliente;
    property nmtplocacao : string read Fnmtplocacao write fnmtplocacao;
    property dslayoutequipamento : string read Fdslayoutequipamento write fdslayoutequipamento;
    property bovlcaucao : string read Fbovlcaucao write fbovlcaucao;
    property bovlacessorio : string read Fbovlacessorio write fbovlacessorio;
    property bovlacrescimo : string read Fbovlacrescimo write fbovlacrescimo;
    property bonmacessorio : string read Fbonmacessorio write fbonmacessorio;
    property bocoresponsavel : string read Fbocoresponsavel write fbocoresponsavel;
    property bodtprevista : string read Fbodtprevista write fbodtprevista;
    property boentregaparcial : string read Fboentregaparcial write fboentregaparcial;
    property borenovarcontrato : string read Fborenovarcontrato write fborenovarcontrato;
    property boequipamentosaldo : string read Fboequipamentosaldo write fboequipamentosaldo;
    property boassociarfuncionariotroca : string read Fboassociarfuncionariotroca write fboassociarfuncionariotroca;
    property bousuarioentregue : string read Fbousuarioentregue write fbousuarioentregue;
    property boentregue : string read Fboentregue write fboentregue;
    property borecebido : string read Fborecebido write fborecebido;
    property nudiainicial : integer read Fnudiainicial write fnudiainicial;
    property booperador : string read fbooperador write fbooperador;
  end;

implementation

end.
