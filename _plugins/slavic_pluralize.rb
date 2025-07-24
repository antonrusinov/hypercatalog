module Jekyll
  module SlavicPluralize
    def slavic_pluralize(input, forms)
      count = input.to_i

      # Slavic rules: one, few (2–4), many (5+ or 0 or teens)
      mod10 = count % 10
      mod100 = count % 100

      key =
        if mod10 == 1 && mod100 != 11
          'one'
        elsif mod10.between?(2, 4) && !(mod100.between?(12, 14))
          'few'
        else
          'many'
        end

      forms[key] || forms.values.first
    end
  end
end

Liquid::Template.register_filter(Jekyll::SlavicPluralize)
