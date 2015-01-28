module FormHelper
  def form_buttons f, options={}
    content_tag(:div) do
      options[:submit_text] ||= "Save"
      inline_cancel(options) + inline_submit(f, options)
    end
  end

  def inline_submit f, options={}
    f.button(:submit, options[:submit_text],
             class: "btn btn-primary")
  end

  def inline_cancel options={}
    submit_tag "Cancel", class: "btn btn-default", type: "button", "data-dismiss" => "modal"
  end
end
