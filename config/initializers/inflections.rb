# Be sure to restart your server when you modify this file.

# Add new inflection rules using the following format
# (all these examples are active by default):
 ActiveSupport::Inflector.inflections do |inflect|
#   inflect.plural /^(ox)$/i, '\1en'
#   inflect.singular /^(ox)en/i, '\1'
#   inflect.irregular 'person', 'people'
inflect.irregular 'vehiculo', 'vehiculos'
inflect.irregular 'cita', 'citas'
inflect.irregular 'orden', 'ordenes'
inflect.irregular 'orden', 'ordenes'
inflect.irregular 'estado', 'estados'
inflect.irregular 'ordendetalle', 'ordendetalles'
inflect.irregular 'serviciorepuesto', 'serviciorepuestos'
#   inflect.uncountable %w( fish sheep )
 end
