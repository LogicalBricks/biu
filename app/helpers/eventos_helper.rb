module EventosHelper
  def eventos_principales
    if @eventos.size > 1
      @eventos[1..([5, @eventos.size].max)]
    else
      @eventos
    end
  end

  def link_to_evento evento, nombres
    link_to(image_tag(
      evento.fotografias.first.imagen_url(:thumb).to_s,
      title: nombres,
      data: {placement: 'bottom'}
    ), evento_path(evento))
  end
end
