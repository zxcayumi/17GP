using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;

namespace NDolls.ZDGL
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            String connectionString = Configuration.GetConnectionString("Default");
            services.AddDbContext<DBContext>(options => { options.UseSqlServer(connectionString); });
            services.AddCors(options =>
            {
                options.AddPolicy("any", builder =>
                {
                    builder.AllowAnyOrigin()
                    .AllowAnyMethod()
                    .AllowAnyHeader(); //允许任何来源的主机访问
                });
            });


            //注册AutoMapper
            services.AddAutoMapper(typeof(ModelsDTO.DTOProfile));
            //注册类服务
            services.AddScoped<IService.IIDCardService, Service.IDCardService>();
            services.AddScoped<IService.ICardDispenserService, Service.CardDispenserService>();
            services.AddScoped<IService.ICradReaderService, Service.CardReaderService>();

        }


        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            app.UseCors("any");

            app.UseRouting();

         //   app.UseAuthorization();

            //app.UseEndpoints(endpoints =>
            //{
            //    endpoints.MapControllers();
            //});
         

       
        }
    }
}
