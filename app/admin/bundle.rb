ActiveAdmin.register_page 'Bundle' do
  sidebar :daily_bundles do
    ul do
      Chunk.bundles.last(30).each do |bundle|
        li link_to(bundle.first.strftime("%d %B, %Y"), admin_bundle_path(date: bundle.first))
      end
    end
  end

  content do
    date = Date.parse(params[:date]) rescue Date.today

    h3 date.strftime("%d %B, %Y")
    para Chunk.bundle(date).map(&:content).join('')
  end
end
