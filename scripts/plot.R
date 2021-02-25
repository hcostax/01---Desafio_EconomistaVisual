
# |||||||||||||||||||||||||||||||||||||||
# 
#   DESAFIO: Reprodução de visualização
#            EconomistaVisual
#
#   Autor:        Henrique C. Costa
#   Blog:         https://hcostax.com/
#
#----------------------------------------

# -------------------------------------------------------------


library(extrafont)            # Pacote para customizar a fonte


# font_import("./")             # funcao para importar a fonte
# y

# ao importar, o sistema pedira 
# que confirme a importacao
# rode essa letra "y" para confirmar


# loadfonts(device = "win")     # carregar as fontes


# carregar o tema customizado
source(here::here("scripts", "custom_theme.R"))


# -------------------------------------------------------------


# GERANDO O GRAFICO


plot <- CB %>% 
  
  ggplot(aes(x=Data)) +
  geom_line(
    aes(y = Valor), 
    size = 3, 
    colour = '#e20000', 
    alpha = 0.1
    ) +
  
  geom_line(
    aes(y = Valor), 
    size = 2, 
    colour = '#e20000', 
    alpha = 0.2
    ) +
  
  geom_line(
    aes(y = Valor), 
    size = 1, 
    colour = '#e20000', 
    alpha = 0.5
    ) +
  
  geom_line(
    aes(y = Valor), 
    size = 0.75, 
    colour = '#e20000'
    ) +
  
  annotate(
    geom="text", 
    x=as.Date("2000-01-01"), 
    y=160,
    label="R$ 112,22", 
    size=4, 
    color = "#e20000", 
    family = "Teko"
    ) +
  
  annotate(
    geom="point", 
    x=as.Date("2000-01-01"), 
    y=112, 
    size=3, 
    color = "#e20000"
    ) +
  
  annotate(
    geom="point", 
    x=as.Date("2000-01-01"), 
    y=112, 
    size=5, 
    shape=21, 
    fill="transparent", 
    color="#e20000" 
    ) +
  
  annotate(
    geom="text", 
    x=as.Date("2016-01-01"), 
    y=500,
    label="R$ 448,31", 
    size=4, 
    color = "#e20000", 
    family = "Teko"
    ) +
  
  annotate(
    geom="point", 
    x=as.Date("2016-01-01"), 
    y=448.31, 
    size=3, 
    color = "#e20000"
    ) +
  
  annotate(
    geom="point", 
    x=as.Date("2016-01-01"), 
    y=448.31, 
    size=5, 
    shape=21, 
    fill="transparent", 
    color="#e20000" 
    ) +
  
  annotate(
    geom="text", 
    x=as.Date("2021-01-01"), 
    y=700,
    label="R$ 654,15", 
    size=4, 
    color = "#e20000", 
    family = "Teko"
    ) +
  
  annotate(
    geom="point", 
    x=as.Date("2021-01-01"), 
    y=654.15, 
    size=3, 
    color = "#e20000"
    ) +
  
  annotate(
    geom="point", 
    x=as.Date("2021-01-01"), 
    y=654.15, 
    size=5, 
    shape=21, 
    fill="transparent", 
    color="#e20000" 
    ) +
  
  labs(
    x = NULL,
    y = NULL,
    title='Valor da cesta básica',
    subtitle = "Com base na cidade de São Paulo-SP",
    caption='Fonte: https://www.dieese.org.br/cesta/ \nDataViz: @hcostax'
    ) +
  
  scale_x_date(
  date_breaks = "1 year", 
  date_labels = "%Y" 
  ) +
  
  scale_y_continuous(
    breaks = seq(
      from = 0, 
      to = 700, 
      by = 100
      ),
    limits=c(0, 700),
    labels = scales::dollar_format(
      prefix="R$"
      )
  ) +
  
  custom_theme()


# ---

print(plot)


# ---


# salvar plot com alta definicao em PNG

library(Cairo)


Cairo(file = here::here("img", 
  paste0("Plot_Cesta_Basica__", 
    format(
      Sys.time(), "%d-%m-%Y__%H-%M"), ".png")
  ), 
      type="png",
      units="in", 
      width=7, 
      height=5, 
      pointsize=12*300/72, 
      dpi=300)

print(plot)


# Closing the graphical device
dev.off() 



# salvar plot em pdf - alta definicao

library(Cairo)
CairoPDF(file = here::here("img",
                           paste0("Plot_Cesta_Basica__", 
                                        format( Sys.time(), "%d-%m-%Y__%H-%M"), 
                                  ".pdf")
                           ),
  width = 7, 
  height = 5
)


print(plot)


# Closing the graphical device
dev.off() 
