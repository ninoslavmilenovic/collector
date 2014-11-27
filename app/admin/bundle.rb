ActiveAdmin.register_page 'Bundle' do
  sidebar :daily_bundles do
    ul do
      Bundle.last(30).reverse.each do |bundle|
        li link_to(bundle.date.strftime("%d %B, %Y"), admin_bundle_path(date: bundle.date))
      end
    end
  end

  content do
    date = Date.parse(params[:date]) rescue Bundle.last(1).last.date
    h3 date.strftime("%d %B, %Y")
    para simple_format(Bundle.get(date).content)
  end
end
