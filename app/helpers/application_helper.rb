module ApplicationHelper
  CutoffDate = Rails.configuration.cutoff_date.strftime('%B %e, %Y')

  def render_markdown(content)
    return if content.blank?

    Redcarpet::Markdown.new(
      Redcarpet::Render::HTML,
      filter_html: true,
      no_images: true,
      safe_links_only: true
    ).render(content).html_safe
  end
end
